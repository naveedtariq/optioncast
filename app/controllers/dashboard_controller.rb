class DashboardController < ApplicationController
include ActionView::Helpers::NumberHelper
before_action :require_login, :stats

  def stats
    @ranks = get_ranks
  end

  def recommendations
  
    @recommendations = Plan.all
    
    @collapse_after = 1 
  end

  def how_to
  
    @help_tips = HelpTips.all
    
  end

  def charts
  end

  def averages
  end

  def render_data
    @user = User.includes(user_answers: :question).order("questions.order").find_by_id(current_user.id)
    @user.user_answers.each do |ans|
      if ans.question.kind == 'Value'
        ans.value = number_to_currency(ans.value.to_f)
      end
    end
    if @user.user_answers.length == 0
      @questions = Question.all
      @questions.count.times {@user.user_answers.build}
      @user.user_answers.zip(@questions).each do |user_answer,question|
        user_answer.question = question
      end
    end
  end

  def data
    @readonly = true
    render_data
  end

  def submit
    if params[:edit]
      @readonly = false
      render_data
      render "data"
    else
      @user = current_user
      
      params["user"]["user_answers_attributes"].each do |index,ans|
        if ans["kind"] == "Value"
          ans["value"] = ans["value"].to_s.gsub(/[$,]/,'').to_f
        end
      end
      
      @user.update_attributes(params.require(:user).permit(:goal_id, :email, :password, :password_confirmation, user_answers_attributes: [:id, :question_id, :answer_id, :value]))
      
      if @user.save
        @readonly =true

        if session[:retirement_rank]
          session.delete(:retirement_rank)
        end
        if session[:income_rank]
          session.delete(:income_rank)
        end
        if session[:financial_rank]
          session.delete(:financial_rank)
        end
      end
    
      redirect_to data_path
    end
    
  end

protected
  def require_login
    unless current_user
      session[:previous_url] = request.fullpath 
      redirect_to new_user_session_path
    end
  end

  def get_ranks

    if session[:retirement_rank] and session[:income_rank] and session[:financial_rank]
      puts "ranks: skipped"
      return {:retirement_rank => session[:retirement_rank], 
              :income_rank => session[:income_rank], 
              :financial_rank => session[:financial_rank]}
    end

    @user = User.includes(:user_answers).find_by_id(current_user.id)

    if !@user or @user.user_answers.length == 0 
      puts "ranks: user not found"
      return {:retirement_rank => 'NA',
              :income_rank => 'NA', 
              :financial_rank => 'NA'}
    end

    @user_answers = {}

    @user.user_answers.each do |ans|
      @user_answers [ans.question_id] = ans.value
    end

    @date_of_birth_str = @user_answers[1]
    @annual_income = @user_answers[2].to_f
    @retirement_savings = @user_answers[3].to_f
    @current_savings = @user_answers[4].to_f
    @debt = @user_answers[5].to_f
    
    @current_date = Date.today 
    @date_of_birth = Date::strptime(@date_of_birth_str,"%Y-%m-%d") 
    @age = @current_date.year - @date_of_birth.year - (@date_of_birth.to_date.change(:year => @current_date.year) > @current_date ? 1 : 0)
    if @age < 0
      @age = 0
    end
    
    {:retirement_rank => get_retirement_rank, :income_rank => get_income_rank, :financial_rank=> get_financial_rank}
  end

  def get_retirement_rank
    if session[:retirement_rank]
      puts "retirement_rank skipped"
      return session[:retirement_rank]
    end

    @retirement_rank = 'NA'

    @total_savings = @retirement_savings + @current_savings

    @retirement_rank_range = RetirementRankMetadata.where("lower_age <= #{@age} and upper_age >= #{@age}").first

    if @retirement_rank_range

      @savings_multiplier = @retirement_rank_range["savings_multiplier"]

      if @savings_multiplier

        @projected_savings = (@annual_income * @savings_multiplier).to_f

        if @projected_savings > 0
          @retirement_rank = ((@total_savings / @projected_savings)*100).round
        end

      end

    end

    session[:retirement_rank] = @retirement_rank
    return @retirement_rank

  end

  def get_income_rank
    if session[:income_rank]
      puts "income_rank skipped"
      return session[:income_rank]
    end

    @income_rank = 'NA'

    @income_rank_range = IncomeRankMetadata.where("lower_income <= #{@annual_income} and (upper_income >= #{@annual_income} or upper_income is NULL)").first
    
    if @income_rank_range
      @lower_income = @income_rank_range["lower_income"].to_f
      @upper_income = @income_rank_range["upper_income"].to_f
      @percentage = @income_rank_range["percentage"].to_f
      @percentage_below = @income_rank_range["percentage_below"].to_f
      
      if @upper_income - @lower_income > 0
        @range_percentile = 1 - (@upper_income - @annual_income).to_f/(@upper_income - @lower_income).to_f   
        @range_percentage = @percentage * @range_percentile
        @income_rank = (@range_percentage + @percentage_below).round
      end
    
    end

    session[:income_rank] = @income_rank
    return @income_rank

  end

  def get_financial_rank
    if session[:financial_rank]
      puts "financial_rank skipped"
      return session[:financial_rank]
    end

    @financial_rank = 'NA'

    @median_net_worth_range = FinancialRankMetadata.where("lower_age <= #{@age} and (upper_age >= #{@age} or upper_age is NULL)").first

    if @median_net_worth_range
      @net_worth = (@retirement_savings + @current_savings - @debt)

      @percentiles = [1,10,30,50,70,90,100]
      @medians_range = []

      @percentiles.each do |i| 
        @medians_range << @median_net_worth_range["median#{i}"]
      end

      if @net_worth < @medians_range[0]
        @financial_rank = 1
      elsif @net_worth >= @medians_range[6]
        @financial_rank = 100
      else
        @medians_range.zip(@percentiles).each do |range, percentile|
          if @net_worth >= range
            @lower_range = range
            @lower_percentile = percentile
          elsif @net_worth < range
            @upper_range = range
            @upper_percentile = percentile
            break
          end
        end

        if (@upper_range - @lower_range) > 0
          @linear_weighted_average_percentile = (@net_worth - @lower_range).to_f/(@upper_range - @lower_range).to_f
          @raw_rank = (@upper_percentile - @lower_percentile) * @linear_weighted_average_percentile
          @financial_rank = (@raw_rank + @lower_percentile).round
        end
        
      end

    end

    session[:financial_rank] = @financial_rank
    return @financial_rank

  end

end


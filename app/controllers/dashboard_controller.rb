class DashboardController < ApplicationController
include ActionView::Helpers::NumberHelper
before_action :require_login, :stats

  def stats
    @tips = get_tool_tips()
    @ranks = ""
    @financial_status = ""
    if session[:ranks]
      @ranks = session[:ranks]
    else
      @ranks = get_ranks()
      session[:ranks] = @ranks
    end

    if session[:financial_status]
      @financial_status = session[:financial_status]
    else
      @financial_status = get_financial_status()
      session[:financial_status] = @financial_status
    end
    
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

        if session[:ranks]
          session.delete(:ranks)
        end
        if session[:financial_status]
          session.delete(:financial_status)
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
    
    return {:retirement_rank => get_retirement_rank, :income_rank => get_income_rank, :financial_rank=> get_financial_rank}
  end

  def get_retirement_rank

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

    return @retirement_rank

  end

  def get_income_rank

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

    return @income_rank

  end

  def get_financial_rank

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

    return @financial_rank

  end

  def get_tool_tips 
    @tips = {}
    @tool_tips = ToolTips.all
    @tool_tips.each do |tip|
      if tip["rank"] == "RetirementRank"
        @tips[:retirement_rank] = tip["description"]
      end
      if tip["rank"] == "IncomeRank"
        @tips[:income_rank] = tip["description"]
      end
      if tip["rank"] == "FinancialRank"
        @tips[:financial_rank] = tip["description"]
      end
    end
    return @tips
  end

  def get_financial_status()

    if @ranks[:income_rank] == 'NA' or @ranks[:retirement_rank] == 'NA'
      return [];
    end

    @q1 = "Your current income of #{number_to_currency(@annual_income)} puts you in the #{@ranks[:income_rank]} percentile."
    @q2 = "In order to retire by 67 with your current lifestyle, experts recommend that you should have saved #{number_to_currency(@projected_savings)} by now."
    @q3 = "Your total savings is #{@ranks[:retirement_rank]}% of the recommended level."
    
    @dept_income_pecentage = 100
    if @annual_income > 0
      @dept_income_pecentage = (@debt/50) / (@annual_income/12)* 100
    end

    @skip = false
    @q4 = ""
    if  @dept_income_pecentage > 40
      @q4 = "Budgeting and finding ways to lower your debt should be one of your top priorities. Otherwise, too much of your income is going to be eaten up by debt payments rather than going towards your nest egg. Personal Capital and Future Advisor have great tools to help you with that." 
    elsif @dept_income_pecentage >= 35 and @dept_income_pecentage <= 40
      @q4 = "Your total debt is manageable for your income level but you don’t have a lot of wiggle room.  Temporary unemployment or expenses such as medical bills can really throw you off track. Maintaining an emergency fund of 3-6 months of living expenses, in addition to your retirement savings, is important so that you don’t find yourself racking up credit card debt to handle the unexpected. Personal Capital and Future Advisor have great free tools to help you maintain your budget and avoid debt."
    elsif @dept_income_pecentage < 35 and @ranks[:retirement_rank] < 100
      @q4 = "Based on the low amount of debt relative to your income level, your savings should be much higher to this point. Staying on top of your personal finances using budgeting tools from Personal Capital and Future Advisor should help you increase your savings for retirement."
    elsif @dept_income_pecentage < 35
      @q4 = "Your overall debt and monthly payments are very manageable given your income so your main focus should be on growing your savings and not debt reduction. Personal Capital and Future Advisor have great free tools as well as low cost premium services to help you improve your investment returns."
      @skip = true
    end
          
    @q5 = ""
    if @skip == false
      if @ranks[:retirement_rank] < 80
        @q5 = "In order to improve your retirement outlook, we recommend trying some of the free tools available to you at Personal Capital and Future Advisor."
      elsif @ranks[:retirement_rank] >= 80 and @ranks[:retirement_rank] <= 125
        @q5 = "While your savings is roughly where it should be, unforeseen expenses might require an additional cushion to last through your retirement years. Our partners at Personal Capital and Future Advisor specialize in helping you manage your money and grow your savings so that you will have enough money to retire comfortably."
      elsif @ranks[:retirement_rank] > 125
        @q5 = "Congratulations, your current retirement savings of #{number_to_currency(@projected_savings-@total_savings)} exceeds the amount you should have saved at this point in your career. Our partners at Personal Capital and Future Advisor have tools and advisors that can help you manage your money and grow your savings so that you can remain ahead of the curve."
      end
    end
    return [@q1,@q2,@q3,@q4,@q5]
  end


end


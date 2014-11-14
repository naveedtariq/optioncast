class DashboardController < ApplicationController

before_action :require_login, :stats

  def stats
    @stat_values = [19100,219100,get_user_rank,1099] 
  end



  def recommendations
  
    @recommendations = Plan.all
    
    @collapse_after = 1 
  end

  def charts
  end

  def averages
  end

  def data
    @user = User.new()
    @questions = Question.all
    @questions.count.times {@user.user_answers.build}
    @user.user_answers.zip(@questions).each do |user_answer,question|
      user_answer.question = question
    end
  end

protected
  def require_login
    unless current_user
      session[:previous_url] = request.fullpath 
      redirect_to new_user_session_path
    end
  end

  def get_user_rank()
    #if session[:user_rank]
    #  puts "Rank skipped"
    #  return session[:user_rank]
    #end

    @user = User.includes(:user_answers).find_by_id(current_user.id)

    puts @user.user_answers.inspect


    @user_answers = {}

    if @user.user_answers.length == 0 
      @rank = 'NA'
      session[:user_rank] = @rank
      return @rank
    end

    @user.user_answers.each do |ans|
      @user_answers [ans.question_id] = ans.value
    end


    @date_of_birth_str = @user_answers[1]
    @current_date = Date.today 
    
    @date_of_birth = Date::strptime(@date_of_birth_str,"%Y-%m-%d") 
    @age = @current_date.year - @date_of_birth.year - (@date_of_birth.to_date.change(:year => @current_date.year) > @current_date ? 1 : 0)

    @median_net_worth_range = RankingData.where("lower_age <= #{@age} and (upper_age >= #{@age} or upper_age is NULL)").first

    @retirement_savings = @user_answers[3].to_i
    @current_savings = @user_answers[4].to_i
    @debt = @user_answers[5].to_i

    @net_worth = (@retirement_savings + @current_savings - @debt)

    @percentiles = [1,10,30,50,70,90,100]
    @medians_range = []

    @percentiles.each do |i| 
      @medians_range << @median_net_worth_range["median#{i}"]
    end

    if @net_worth < @medians_range[0]
      @rank = 1
    elsif @net_worth >= @medians_range[6]
      @rank = 100
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

      @linear_weighted_average_percentile = (@net_worth - @lower_range).to_f/(@upper_range - @lower_range).to_f
      @raw_rank = (@upper_percentile - @lower_percentile) * @linear_weighted_average_percentile
      @rank = (@raw_rank + @lower_percentile).round

    end
    session[:user_rank] = @rank
    return @rank

  end

end


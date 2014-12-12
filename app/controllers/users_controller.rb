class UsersController < ApplicationController

  layout "devise"

  def questionnaire
  @user_signed_in = false
  @registered_user = false

    if user_signed_in?
      @user_signed_in = true
      if current_user.goal_id #Have filled Questionnaire
        if current_user.is_guest 
          redirect_to edit_user_registration_path
          return
        else
          redirect_to recommendations_path
          return
        end
      end
      if !current_user.is_guest
        @registered_user = true
      end
    end

    @user = User.new()
    @questions = Question.all
    @questions.count.times {@user.user_answers.build}
    @user.user_answers.zip(@questions).each do |user_answer,question|
      user_answer.question = question
    end
  end

  def submit
    params["user"]["user_answers_attributes"].each do |index,ans|
      if ans["kind"] == "Value"
        ans["value"] = ans["value"].to_s.gsub(/[$,]/,'').to_f
      end
    end

    if user_signed_in?
      @user = current_user
      @user.update_attributes(params.require(:user).permit(:goal_id, user_answers_attributes: [:question_id, :answer_id, :value]))
      @user.save
      session.delete(:user)
    else    
      @user = User.new(params.require(:user).permit(:goal_id, user_answers_attributes: [:question_id, :answer_id, :value]))
      session[:user] = params[:user]
    end

    if session[:retirement_rank]
      session.delete(:retirement_rank)
    end
    if session[:income_rank]
      session.delete(:income_rank)
    end
    if session[:financial_rank]
      session.delete(:financial_rank)
    end

    if user_signed_in?
      if current_user.is_guest
        redirect_to edit_user_registration_path
        return
      else
        redirect_to recommendations_path
        return
      end
    else
      redirect_to new_user_registration_path
    end

  end

end
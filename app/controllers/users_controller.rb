class UsersController < ApplicationController

  def questionnaire
    if session[:user]
      @user = User.new(session[:user])
    else
      @user = User.new()
      @questions = Question.all
      @questions.count.times {@user.user_answers.build}
      @user.user_answers.zip(@questions).each do |user_answer,question|
        user_answer.question = question
      end
    end
  end

  def submit
    if user_signed_in?
      puts params.inspect
      @user = current_user
      @user.update_attributes(params.require(:user).permit(:goal_id, :email, :password, :password_confirmation, user_answers_attributes: [:question_id, :answer_id, :value]))
      @user.save
      session[:user] = nil
    else    
      @user = User.new(params.require(:user).permit(:goal_id, :email, :password, :password_confirmation, user_answers_attributes: [:question_id, :answer_id, :value]))
      session[:user] = params[:user]
    end
    redirect_to what_is_optioncast_path
  end

end
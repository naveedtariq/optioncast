class RegistrationsController < Devise::RegistrationsController
  
  private
 
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :goal_id, user_answers_attributes: [:question_id, :answer_id, :value])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end

  public

  def create
    if session[:user].present?
      params[:user] = session[:user].merge(params[:user]) 
      session[:user] = nil
    end
    super
  end
  
end
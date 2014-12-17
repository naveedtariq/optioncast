class SessionsController < Devise::SessionsController

caches_action :create

  def create
    user = User.find_by_email(params[:email].downcase)

    if user && user.valid_password?(params[:password])
      sign_in(:user, user)
      respond_with user, :location => after_sign_in_path_for(user)
    else
      flash[:alert] = "Invalid password"
      redirect_to new_user_session_path
    end
  end

end
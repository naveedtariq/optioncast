class RegistrationsController < Devise::RegistrationsController
  
  layout "devise"

  protected
 
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :goal_id, user_answers_attributes: [:question_id, :answer_id, :value])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :is_guest)
  end

  def after_update_path_for(resource)
      recommendations_path
  end
  
  public

  def create
    if session[:user].present?
      params[:user] = session[:user].merge(params[:user]) 
      session.delete(:user)
    end
    
    if user_signed_in? and current_user.is_guest
      params[:user][:id] = current_user.id
    end
    
    super
  end

  def edit
    if user_signed_in? 
      if current_user.is_guest
        super
        return
    end
    redirect_to recommendations_path
    return
  end

  def update
    if user_signed_in? and current_user.is_guest
      params[:user][:is_guest] = false
      params[:user][:current_password] = current_user.email.split(/[^\d]/).join
    end

    super
  end

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    redirect_to recommendations_path
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session.delete(:guest_user_id)
     guest_user if with_retry
  end

  private

  def create_guest_user
    @token = "#{Time.now.to_i}#{rand(100)}"
    u = User.create(:email => "guest_#{@token}@financialrank.com", :password => "#{@token}", :password_confirmation => "#{@token}" )
    if session[:user].present?
      params = ActionController::Parameters.new({user: {}})
      params[:user] = session[:user].merge(params[:user]) 
      u.update_attributes(params.require(:user).permit(:goal_id, user_answers_attributes: [:question_id, :answer_id, :value]))
      session.delete(:user)
    end
    u.is_guest = true
    u.save
    session[:guest_user_id] = u.id
    u
  end
  
end
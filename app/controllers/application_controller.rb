class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if session[:previous_url]
        session[:previous_url]
        session.delete(:previous_url)
      elsif resource.is_a?(AdminUser)
        admin_root_path
      elsif resource.is_a?(User)
        recommendations_path
      else
        super
      end
    end
    
    def after_sign_out_path_for(resource_or_scope)
      reset_session
      root_path
    end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :is_guest) }
     devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :is_guest) }
   end
end

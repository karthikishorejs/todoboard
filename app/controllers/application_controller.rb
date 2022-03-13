class ApplicationController < ActionController::Base
  #CSRF attacks
  protect_from_forgery with: :exception

  #add permissions to application controller 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home 
    redirect_to posts_url
  end

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name_full, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name_full, :email, :password, :current_password)}
  end
end

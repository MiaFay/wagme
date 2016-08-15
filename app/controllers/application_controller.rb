class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_meetups  # without authentication
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def load_meetups
    @meetups = Meetup.all
  end

  protected

  def after_sign_in_path_for(users)
    meetups_path
  end

  def after_sign_out_path_for(users)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }

  end
end

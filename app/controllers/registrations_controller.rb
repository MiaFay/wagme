class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def sign_up(_resource_name, _resource)
  end

  def after_sign_up_path_for(_resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :city, :state, :zip) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  end

end

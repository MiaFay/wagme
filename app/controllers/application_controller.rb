class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(users)
    meetups_path
  end

  def after_sign_out_path_for(users)
    new_user_session_path
  end
end

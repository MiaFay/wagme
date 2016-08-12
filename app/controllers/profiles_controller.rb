class ProfilesController < ApplicationController
  def show
    @users_dog = current_user.dog
    @users_name = current_user.name
    @users_photo = current_user.avatar
    @users_meeup = current_user.meetups
  end
end

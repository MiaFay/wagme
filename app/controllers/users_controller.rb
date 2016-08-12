class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @meetup = @user.meetups
    @dog = Dog.new
    @dogs = @user.dogs
    @name = @user.name
    @user_photo = current_user.avatar
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    redirect_to members_path, notice: "User Deleted"
  end
end

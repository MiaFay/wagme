class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @meetups = @user.meetups
    @dogs = Dog.find(params[:id])
    @name = @user.name
    end
end

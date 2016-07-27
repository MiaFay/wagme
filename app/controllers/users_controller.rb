class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @meetups = @user.meetups
    @dog = Dog.new
    @dogs = @user.dogs
    @name = @user.name
  end


end

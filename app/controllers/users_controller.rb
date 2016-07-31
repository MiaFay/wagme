class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @meetup = @user.meetups
    @dog = Dog.new
    @dogs = @user.dogs
    @name = @user.name
  end
end

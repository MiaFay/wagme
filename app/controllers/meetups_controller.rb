class MeetupsController < ApplicationController

  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
    @users = User.find(params[:id])
  end
end

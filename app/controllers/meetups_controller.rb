class MeetupsController < ApplicationController

  def index
    @meetups = Meetup.all
  end

  def create
    @meetup = Meetup.new(params_meetup)
    @meetup.user = current_user
    if @meetup.save
      flash[:notice] = 'Meetup successfully added!'
      redirect_to meetup_path(@meetup)
    else
      flash[:error] = @meetup.errors.full_messages.join(', ')
      render :new
    end
  end

  def new
    @meetup = Meetup.new
    if current_user.nil?
      flash[:errors] = "Please sign in to add a meetup!"
      redirect_to meetups_path
    end
  end

  def show
    @meetup = Meetup.find(params[:id])
    @users = User.find(params[:id])
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup = Metup.find(params[:id])
    if @meetup.update(meetup_params)
      flash[:success] = 'Metup successfully updated!'
      redirect_to profile_path(current_user)
    else
      flash[:errors] = @meetup.errors.full_messages.join(', ')
      render :edit
    end
  end

  def params_meetup
    params.require(:meetup).permit(:name, :description, :location)
  end
end

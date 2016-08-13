class MeetupsController < ApplicationController

  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
    @user = @meetup.user_id
  end

  def new
    @meetup = Meetup.new
    if current_user.nil?
      flash[:errors] = "Please sign in to add a meetup!"
      redirect_to meetups_path
    end
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    if @meetup.save
      flash[:notice] = 'Meetup successfully added!'
      redirect_to meetup_path(@meetup)
    else
      flash[:error] = @meetup.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    @meetup = Meetup.find(params[:id])
    if @meetup.update(meetup_params)
      flash[:success] = 'Metup successfully updated!'
      redirect_to meetup_path
    else
      render :edit
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    redirect_to meetups_path
  end

  private

  def meetup_params
    params.require(:meetup).permit(:name, :description, :location)
  end
end

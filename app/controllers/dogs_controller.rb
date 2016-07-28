class DogsController < ApplicationController
  def show
    @dog = @dog.find(params[:id])
    @users_dog = current_users.dogs
    @users_name = current_user.first_name + current_user.last_name
  end

  def new
    @user = User.find(params[:id])
    @dog = Dog.new
  end

  def create
    # @user = User.find(params[:user_id])
    @dog = Dog.new(dog_params)
    @user = current_user
    if @dog.save
      flash[:notice] = 'Dog added successfully'
      redirect_to user_path(@user)
    else
      flash[:error] = @dog.errors.full_messages.join(', ')
      redirect_to user_path(@user)
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:dog_name, :breed, :sex, :neutered, :vaccinated, :temperment, :age).merge(user: current_user)
  end
end

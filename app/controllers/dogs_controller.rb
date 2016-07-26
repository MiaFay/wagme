class DogsController
  def show
    @owner = User.find(params[:id])
    @dog = @dog.find(params[:id])
    @users_dog = current_users.dogs
    @users_name = current_user.first_name + current_user.last_name
  end

  def create
    @dog = Dog.new
  end

  def params_dog
    params.require(:meetup).permit(:dog_name, :breed, :sex, :neutered, :vaccinated, :description, :age)
  end
end

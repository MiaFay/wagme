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

  def new
    @user = User.find(params[:id])
    @dog = Dog.new

  def dog_params
    params.require(:dog).permit(:dog_name, :breed, :sex, :neutered, :vacinated, :temperment, :age)
  end
end

class DogsController
  def show
    @users_dog = current_users.dogs
    @users_name = current_user.first_name + current_user.last_name
  end
end

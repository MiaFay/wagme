module AuthenticationHelper
  def login_user(user)
    visit new_user_session_path
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end

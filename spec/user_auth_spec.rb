require 'rails_helper'

feature 'sign up' do
  scenario 'specifying valid and required information' do
    visit '/'
    fill_in 'First Name', with: 'Rafiki'
    fill_in 'Last Name', with: 'user@example.com'
    fill_in 'City', with: 'user@example.com'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '00000'

    click_button 'Sign Up'

  end
end

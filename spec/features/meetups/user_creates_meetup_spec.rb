require 'rails_helper'
require 'spec_helper'
require 'shoulda-matchers'

feature 'user signs in and creates a meetup', :devise do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user fills out meetup form sucsessfully' do
    visit new_meetup_path
    login_user(user)
    click_link 'Create A Meetup'
    fill_in 'Name', with: 'Danahey Dog Park'
    fill_in 'Location', with: '(42.38906110196173, -71.13333705828859)'
    fill_in 'Description', with: 'The greatest meetup in the world.'
  end
end

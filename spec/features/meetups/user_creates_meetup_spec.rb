require 'rails_helper'
require 'spec_helper'
require 'shoulda-matchers'

feature 'user signs in and creates a meetup', :devise do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user fills out meetup form sucsessfully' do
    login_user(user)
    click_link 'Create Meetup'
    fill_in 'Name', with: 'Danahey Dog Park'
    fill_in 'Address', with: '31 Stewart Street'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'Massachusetts'
    fill_in 'Zip', with: '02120'

  end
end

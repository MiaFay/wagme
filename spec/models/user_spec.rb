require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe User do

  it { should have_valid(:email).when('user@example.com', 'another@example.com') }
  it { should_not have_valid(:email).when(nil, '') }

  it 'has matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(page)
  end

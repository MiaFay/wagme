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

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank

  end

  it "rejects invalid emails" do
    user = User.new
    user.first_name = "Bob"
    user.last_name = "Loblaw"
    user.email = "foo"

    expect(user.valid?).to eq(false)
  end
end

require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'


describe Meetup, type: :model do
  it { should have_valid(:name).when('Meetup in the park') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:location).when('Danahey park...') }
  it { should_not have_valid(:location).when('', nil) }

  it { should have_valid(:description).when("lets meet up at the park") }
  it { should_not have_valid(:description).when("", nil) }

end

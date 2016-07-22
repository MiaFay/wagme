require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe Meetup do
  it { should have_valid(:name).when('Meetup in the park') }
  it { should have_valid(:location).when('Danahey park...') }
  it { should have_valid(:description).when("lets meet up at the park") }
  it { should have_valid(:creator_id).when(1)}

  it { should_not have_valid(:name).when('', nil) }
  it { should_not have_valid(:location).when('', nil) }
  it { should_not have_valid(:description).when("", nil) }
  it { should_not have_valid(:creator_id).when("", nil) }
## should probably test validations in here

end

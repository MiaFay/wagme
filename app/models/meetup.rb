class Meetup < ActiveRecord::Base
belongs_to :user

validates :name, presence: true
validates :description, presence: true
validates :location, presence: true
validates :user_id, presence: true
end

class Meetup < ActiveRecord::Base
belongs_to :user
has_many :user_meetups
has_many :attendees, through: :user_meetups, source: :user


validates :name, presence: true
validates :description, presence: true
validates :location, presence: true
validates :user_id, presence: true
end

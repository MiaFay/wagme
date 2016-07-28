class User < ActiveRecord::Base
  has_many :meetups
  has_many :dogs
  has_many :user_meetups
  has_many :is_attending_meetups, through: :user_meetups, source: :meetup

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: true, length: { is: 5 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def name
    [first_name, last_name].compact.join(' ')
  end

end

class User < ActiveRecord::Base
  has_many :meetups

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

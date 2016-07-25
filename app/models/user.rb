class User < ActiveRecord::Base
  has_many :users

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: true, length: { is: 5 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def name
    [firstname, middlename, lastname].compact.join(' ')
  end

end

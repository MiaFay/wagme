class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :meetups
  has_many :dogs
  has_many :user_meetups
  has_many :is_attending_meetups, through: :user_meetups, source: :meetup


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: true, length: { is: 5 }

  def name
    [first_name, last_name].compact.join(' ')
  end

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end

end

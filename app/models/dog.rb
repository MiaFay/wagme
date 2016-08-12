class Dog < ActiveRecord::Base
  belongs_to :user

  validates :dog_name, presence: true
  validates :breed, presence: true
  validates :sex, presence: true
  validates :neutered, inclusion: { in: [true, false] }
  validates :vaccinated, inclusion: { in: [true, false] }
  validates :temperment, presence: true
  validates :age, inclusion: { in: 1..28 }
  # validates :photo_url, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] } holding for carrierwave implementation
end

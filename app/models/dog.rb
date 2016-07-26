class Dog < ActiveRecord::Base
  belongs_to :users


  validates :dog_name, presence: true
  validates :breed, presence: true
  validates :sex, presence: true
  validates :neutered, inclusion: { in: [true, false] }
  validates :vacinated, inclusion: { in: [true, false] }
  validates :temperment, presence: true
  validates :age, inclusion: { in: 1..28 }
end

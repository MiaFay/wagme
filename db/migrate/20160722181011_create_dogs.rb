class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :dog_name, null: false, limit: 50
      t.string :breed, null: false, limit: 50
      t.string :sex, presence: true
      t.boolean :neutered, presence: true
      t.boolean :vaccinated, presence: true
      t.text :description, null: false
      t.integer :age
      t.belongs_to :users
    end
  end
end

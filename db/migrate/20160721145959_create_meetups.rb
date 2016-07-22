class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.integer :creator_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :meetups, :users, column: :creator_id
  end
end

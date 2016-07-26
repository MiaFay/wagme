class AddUserToDog < ActiveRecord::Migration
  def change
    add_reference :dogs, :user, index: true, foreign_key: true
  end
end

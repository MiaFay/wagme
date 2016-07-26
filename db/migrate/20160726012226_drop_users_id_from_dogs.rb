class DropUsersIdFromDogs < ActiveRecord::Migration
  def change
    change_table :dogs do |t|
      t.remove :users_id
      t.change(:user_id, :integer, null:false)
      t.rename :description, :temperment
    end
  end
end

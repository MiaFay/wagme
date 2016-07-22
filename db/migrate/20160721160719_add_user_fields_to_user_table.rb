class AddUserFieldsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string, limit: 2
    add_column :users, :zip, :string, limit: 5
  end
end

class AddNotNullValuesToUserFields < ActiveRecord::Migration
  def change
    change_column_null :users, :first_name, false, default: ""
    change_column_null :users, :last_name, false, default: ""
    change_column_null :users, :city, false, default: ""
  end
end

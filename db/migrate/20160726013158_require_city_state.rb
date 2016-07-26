class RequireCityState < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :zip, :string, null: false
      t.change :state, :string, null: false
      t.references :dog
    end
  end
end

class DropCreatorFromMeetup < ActiveRecord::Migration
  def change
    remove_column :meetups,:creator_id, null: false
  end
end

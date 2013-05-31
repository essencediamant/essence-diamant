class RemoveFnameAndLnameAndRestoreActiveBoolean < ActiveRecord::Migration
  def change
  	add_column :subscribers, :active, :boolean
  	remove_column :subscribers, :fname
  	remove_column :subscribers, :lname
  end
end

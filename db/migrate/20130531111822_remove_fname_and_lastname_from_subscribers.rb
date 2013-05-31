class RemoveFnameAndLastnameFromSubscribers < ActiveRecord::Migration
  def change
  	remove_column :subscribers, :active, :boolean
  end
end

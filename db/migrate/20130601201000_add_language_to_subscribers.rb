class AddLanguageToSubscribers < ActiveRecord::Migration
  def change
  end
  	add_column :subscribers, :language, :string
end

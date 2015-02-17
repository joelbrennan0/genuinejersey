class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :latitude
  	remove_column :users, :longitude
  	remove_column :users, :title
  	remove_column :users, :address
  	remove_column :users, :parish
  	remove_column :users, :postcode
  	remove_column :users, :description
  	remove_column :users, :gmaps
  	remove_column :users, :picture
  end
end

class RenameUserCategories < ActiveRecord::Migration
  def change
  	rename_table :user_categories, :vendor_categories
  end
end

class RenameColumnsInVendorCategories < ActiveRecord::Migration
  def change
  	rename_column :vendor_categories, :user_id, :vendor_id
  end
end

class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :latitude
      t.string :longitude
      t.string :title
      t.string :address
      t.string :parish
      t.string :postcode
      t.text :description
      t.string :picture
      t.string :contact_name
      t.string :contact_tel
      t.string :contact_email

      t.timestamps
    end
  end
end

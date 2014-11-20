class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :address
      t.string :parish
      t.string :postcode
      t.text :description
      t.string :category
      t.string :picture

      t.timestamps
    end
  end
end

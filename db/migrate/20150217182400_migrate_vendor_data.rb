class MigrateVendorData < ActiveRecord::Migration
  def change
  	User.all.each do |user|
  		Vendor.create(
  			latitude: user.latitude,
  			longitude: user.longitude,
  			title: user.title,
  			address: user.address,
  			parish: user.parish,
  			postcode: user.postcode,
  			description: user.description,
  			picture: user.picture
  			)
  	end
  end
end

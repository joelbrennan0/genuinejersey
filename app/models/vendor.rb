class Vendor < ActiveRecord::Base

	has_many :vendor_categories
	has_many :categories, through: :vendor_categories

	geocoded_by :postcode 
	after_validation :geocode

	PARISHES = ["St Helier", "St Clement", "St Saviour", "St Martin", "Grouville", "Trinity", "St John", "St Mary", "St Ouen", "St Peter", "St Lawrence", "St Brelade"].sort

	validates_presence_of :latitude, :longitude, :title

end

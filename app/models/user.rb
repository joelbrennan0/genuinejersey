class User < ActiveRecord::Base


	geocoded_by :postcode
	after_validation :geocode

end


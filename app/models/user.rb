class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	has_many :user_categories
	has_many :categories, through: :user_categories


	geocoded_by :postcode 
	after_validation :geocode

	PARISHES = ["St Helier", "St Clement", "St Saviour", "St Martin", "Grouville", "Trinity", "St John", "St Mary", "St Ouen", "St Peter", "St Lawrence", "St Brelade"].sort

end


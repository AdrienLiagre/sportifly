class Location < ActiveRecord::Base
  has_many :location_reviews
  has_many :location_sports

end

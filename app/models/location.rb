class Location < ActiveRecord::Base
  has_many :location_reviews
  has_many :location_sports
  has_many :activities

end

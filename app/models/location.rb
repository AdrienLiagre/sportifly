class Location < ActiveRecord::Base
  has_many :location_reviews, dependent: :destroy
  has_many :location_sports, dependent: :destroy
  has_many :activities

end

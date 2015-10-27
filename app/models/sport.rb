class Sport < ActiveRecord::Base
  has_many :favorite_sports
  has_many :location_sports
  has_many :activities

end

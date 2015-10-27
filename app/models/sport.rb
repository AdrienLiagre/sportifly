class Sport < ActiveRecord::Base
  has_many :favorite_sports
  has_many :location_sports
end

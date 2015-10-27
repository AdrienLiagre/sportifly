class LocationSport < ActiveRecord::Base
  belongs_to :location
  belongs_to :sport
end

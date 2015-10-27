class Activity < ActiveRecord::Base
  has_many :bookings
  belongs_to :location
  belongs_to :sport
  belongs_to :user

end

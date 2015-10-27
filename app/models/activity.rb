class Activity < ActiveRecord::Base
  has_many :bookings, dependent: :destroy
  belongs_to :location
  belongs_to :sport
  belongs_to :user

end

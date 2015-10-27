class Activity < ActiveRecord::Base
  has_many :bookings, dependent: :destroy
  belongs_to :location
  belongs_to :sport
  belongs_to :user

  validates :name, :number_of_players, :date, :open, :sport, presence: true

end

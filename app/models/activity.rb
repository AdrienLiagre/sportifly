class Activity < ActiveRecord::Base
  belongs_to :location
  belongs_to :sport
  belongs_to :group
  belongs_to :captain, class_name: 'User', foreign_key: 'captain_id'

  has_many :bookings, through: :users
  has_many :users

  validates :name, :number_of_players, :date, :sport, presence: true
  validates_inclusion_of :open, :in => [true, false]
end

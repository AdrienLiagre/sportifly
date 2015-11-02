class Activity < ActiveRecord::Base
  belongs_to :location
  belongs_to :sport
  belongs_to :group
  belongs_to :captain, class_name: 'User', foreign_key: 'captain_id'

  has_many :bookings
  has_many :users

  validates :name, :number_of_players, :date, :sport, presence: true
  validates_inclusion_of :open, in: [true, false]

  scope :planned, -> { where("date >= :today", today: Date.current) }

  def full?
    self.bookings.count >= self.number_of_players
  end

  def current_user_booked
    self.bookings.each do |booking|
      return booking.user_id
    end
  end
end

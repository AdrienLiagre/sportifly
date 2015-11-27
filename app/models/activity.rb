class Activity < ActiveRecord::Base
  belongs_to :location
  belongs_to :sport
  belongs_to :group
  belongs_to :captain, class_name: 'User', foreign_key: 'captain_id'

  has_many :bookings, dependent: :destroy
  has_many :users
  has_many :comments, through: :bookings

  validates :name, :number_of_players, :date, :sport, presence: true
  validates_inclusion_of :open, in: [true, false]

  scope :passed,  -> { where("date < :today", today: DateTime.current) }
  scope :planned, -> { where("date >= :today", today: DateTime.current) }

  def full?
    self.bookings.confirmed.count >= self.number_of_players
  end

  def user_booked?(user)
    bookings.where(user: user).exists?
  end


end

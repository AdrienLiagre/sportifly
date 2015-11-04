class Location < ActiveRecord::Base
  geocoded_by :full_address

  has_many :activities
  has_many :location_reviews, dependent: :destroy
  has_many :location_sports,  dependent: :destroy

  has_many :reviews, through: :location_sports
  has_many :sports,   through: :location_sports

  validates :address, :city, :name, presence: true
  validates :postcode, numericality: { only_integer: true }

  after_validation :geocode, if: :full_address_changed?

  accepts_nested_attributes_for :location_sports

  def full_address
    return "#{address}, #{postcode}, #{city}"
  end

  def full_address_changed?
    address_changed? || postcode_changed?  || city_changed?
  end
end

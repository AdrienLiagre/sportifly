class Location < ActiveRecord::Base
  has_many :location_reviews, dependent: :destroy
  has_many :location_sports, dependent: :destroy
  has_many :activities

  validates :address, :city, :name, presence: true
  validates :postcode, numericality: { only_integer: true }

end

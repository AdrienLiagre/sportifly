class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :favorite_sports
  has_many :location_reviews
  has_many :newsfeeds
  has_many :activities
  belongs_to :group
end

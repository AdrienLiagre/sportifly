class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :favorite_sports, dependent: :destroy
  has_many :location_reviews, dependent: :destroy
  has_many :newsfeeds, dependent: :destroy
  has_many :activities, dependent: :destroy
  belongs_to :group

  validates :name, presence: true
  validates :phone_number, uniqueness: true
end

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


  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end

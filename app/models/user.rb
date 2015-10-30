require 'email_validator'
require 'mail'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group

  before_create :assign_to_group
  after_create :send_welcome_email

  has_many :bookings, dependent: :destroy
  has_many :favorite_sports, dependent: :destroy
  has_many :location_reviews, dependent: :destroy
  has_many :newsfeeds, dependent: :destroy
  has_many :activities, dependent: :destroy


  validates :email, :presence => true, :email => true

  has_attached_file :picture,
    styles: { medium: "300x300#", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def assign_to_group
    self.group = Group.find_by(email_domain_name: Mail::Address.new(self.email).domain)
  end
end

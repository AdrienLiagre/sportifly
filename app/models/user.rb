require 'email_validator'
require 'mail'

class User < ActiveRecord::Base
  has_merit
  acts_as_voter
  searchkick autocomplete: ['name']

  def search_data
    {
      name: name,
      }
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

  belongs_to :group

  before_create :assign_to_group

  has_many :activities,       dependent: :destroy
  has_many :bookings,         dependent: :destroy
  has_many :favorite_sports,  dependent: :destroy
  has_many :location_reviews, dependent: :destroy
  has_many :newsfeeds,        dependent: :destroy

  validates :email, :presence => true, :email => true

  has_attached_file :picture,
    styles: { medium: "300x300#", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def active_for_authentication?
    super and self.allowed_to_log_in?
  end

  def inactive_message
    "Compte désactivé."
  end
  
  private

  def assign_to_group
    if self.email.include?("stationf")
      self.group = Group.find_by(email_domain_name: "stationf.co")
    elsif self.email.include?("thalasseo")
      self.group = Group.find_by(email_domain_name: "voyageprive.com")
    elsif Token.where(mail: self.email).count > 0
      user_t = Token.where(mail: self.email).first.group_id
      self.group = Group.find_by(id:user_t)
    else
      self.group = Group.find_by(email_domain_name: Mail::Address.new(self.email).domain)
    end
  end

end

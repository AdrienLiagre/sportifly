class Group < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :activities, dependent: :destroy
  has_many :users,      dependent: :nullify
  has_many :newsfeeds, through: :users, dependent: :destroy

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  validates :email_domain_name, presence: true
end


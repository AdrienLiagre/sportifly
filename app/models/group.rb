class Group < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :users
  has_many :activities, through: :users
  has_many :newsfeeds, through: :users

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end


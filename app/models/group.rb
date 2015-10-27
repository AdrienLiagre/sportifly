class Group < ActiveRecord::Base
  has_many :users

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end

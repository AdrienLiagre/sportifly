class Sport < ActiveRecord::Base
  has_many :favorite_sports
  has_many :location_sports
  has_many :activities

  has_many :locations, through: :location_sports

  validates :name, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>", large: "2000x200"  }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

end

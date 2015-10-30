class Booking < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  has_many :comments, dependent: :destroy


# créer un model boolean, initializer à 0 , et quand dans la vue on change, on passe la valeur, et on la stocke"

end

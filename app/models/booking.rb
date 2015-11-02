class Booking < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :for_user,  -> (user) { where(user: user) }
  scope :passed,    -> { joins(:activity).merge(Activity.passed) }
  scope :planned,   -> { joins(:activity).merge(Activity.planned) }

  # créer un model boolean, initializer à 0 , et quand dans la vue on change, on passe la valeur, et on la stocke"
end

class Booking < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  has_many :comments, dependent: :destroy

  # after_create :send_reminder_email

  scope :for_user,  -> (user) { where(user: user) }
  scope :passed,    -> { joins(:activity).merge(Activity.passed) }
  scope :planned,   -> { joins(:activity).merge(Activity.planned) }
  scope :confirmed, -> { where(status: :confirmed)}
  scope :pending, -> { where(status: :pending)}

  extend Enumerize

  enumerize :status, in: [:pending, :confirmed], default: :confirmed

  private

  def send_reminder_email
    UserMailer.reminder(self.id).deliver_later(wait_until: self.activity.date - 1800 )
  end
end

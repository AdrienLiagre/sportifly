class Comment < ActiveRecord::Base
  belongs_to :booking

  def user_booked?(user)
    bookings.where(user: user).exists?
  end
end

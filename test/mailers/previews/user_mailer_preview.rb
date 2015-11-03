class UserMailerPreview < ActionMailer::Preview
  def reminder
    user = User.first
    UserMailer.reminder(user)
  end
end

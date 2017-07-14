class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def reminder(booking_id)
    @booking = Booking.find(booking_id)
    @user = @booking.user
    @greeting = "Hello !"

    mail to: @user.email, subject: "C'est l'heure du Meetemps !"
  end

  def invitation(email, user)
    @greeting = "Hello !"
    @user = user

    mail to: email, subject: "Invitation à rejoindre Meetemps !"
  end

  def contact(contact)
    @contact = contact
    mail to: "adrien@meetemps.io", subject: "test"
  end

  def activity(email, user, activity, group)
    @greeting = "Chanceux !"
    @user = user
    @activity = activity
    @group = group

    mail to: email, subject: "Tu es invité(e) à flyer une activité sur Meetemps!"
  end

end

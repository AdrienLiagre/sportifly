desc "On envoie les rappels"
task :envoi_rappel => :environment do
  puts "Envoi des rappels en cours..."
  book = Booking.where("DATE(created_at) = ?", Date.today)
  for b in book
  	@email = User.where(id:b.user_id).first.email
  	@activity = Activity.where(id:b.activity_id).first
  	UserMailer.reminder(@email, @activity).deliver_now
  end
  puts "Bim. Ça a marché. On est fort."
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  AdminUser.destroy_all
  Group.destroy_all
  User.destroy_all
  Activity.destroy_all
  LocationSport.destroy_all
  Sport.destroy_all
  Location.destroy_all
end

edhec_lille = Group.create!(name: 'Edhec', description: "Groupe des étudiants de l'Edhec Grande Ecole et Msc, pour plus de fun et de sport !", email_domain_name: 'edhec.com')
hec = Group.create!(name: 'HEC', description: "Groupe des étudiants de HEC", email_domain_name: 'hec.com')
stationf = Group.create!(name: 'HEC', description: "Groupe des étudiants de HEC", email_domain_name: 'stationf.co')

samir = User.new(name: "Samir Benflouka", group: edhec_lille, phone_number: '0675847374', age: 22, crew: "Ad’lib", email: "samir.benflouka@edhec.com", password: 'kikoulol')
samir.skip_confirmation!
samir.save!

samir = User.new(name: "Samir ee", group: stationf, phone_number: '0675847374', age: 22, crew: "Ad’lib", email: "samir.benflouka@edhec.stationf.co", password: 'kikoulol')
samir.skip_confirmation!
samir.save!

samir = User.new(name: "Adri ee", group: stationf, phone_number: '0675847374', age: 22, crew: "Ad’lib", email: "adri@stationf.co", password: 'kikoulol')
samir.skip_confirmation!
samir.save!

samir2 = User.new(name: "Samir Abed", group: edhec_lille, phone_number: '0675337374', age: 32, crew: "Ad’leeib", email: "samir.abed@edhec.com", password: 'kikoulol')
samir.skip_confirmation!
samir.save!

user = User.new(name: "Olivia Legrand", group: edhec_lille, phone_number: '0675847355', age: 20, crew: "OJO", email: "olivia.legrand@edhec.com", password: 'kikoulol')
user.skip_confirmation!
user.save!

user = User.new(name: "Mathieu Plus", group: hec, phone_number: '0675847322', age: 20, crew: "OJO", email: "mathieu.plus@hec.com", password: 'kikoulol')
user.skip_confirmation!
user.save!

paul = User.new(name: "Paul Franco", group: edhec_lille, phone_number: '0675847333', age: 23, crew: "CCE", email: "paul.franco@edhec.com", password: 'kikoulol')
paul.skip_confirmation!
paul.save!

user = User.new(name: "Christine Adou", group: hec, phone_number: '0675847334', age: 22, crew: "SBC", email: "christine.adou@hec.com", password: 'kikoulol')
user.skip_confirmation!
user.save!

user = User.new(name: "Aurélie Nakeseizan", group: edhec_lille, phone_number: '0675841174', age: 22, crew: "SBC", email: "aurelie.nakeseizan@edhec.com", password: 'kikoulol')
user.skip_confirmation!
user.save!

franck = User.new(name: "Frank Saucisse", group: hec, phone_number: '0675846674', age: 23, crew: "Chti", email: "frank.saucisse@hec.com", password: 'kikoulol')
franck.skip_confirmation!
franck.save!

user = User.new(name: "Arthur Mathias", group: edhec_lille, phone_number: '0675657374', age: 22, crew: "Chti", email: "arthur.mathias@edhec.com", password: 'kikoulol')
user.skip_confirmation!
user.save!

user = User.new(name: "Francine Blanche", group: hec, phone_number: '0648847374', age: 22, crew: "Raid", email: "francine.blanche@hec.com", password: 'kikoulol')
user.skip_confirmation!
user.save!

patrick = User.new(name: "Patrick Sebastien", group: edhec_lille, phone_number: '0675245374', age: 21, crew: "Musicall", email: "patrick.sebastien@edhec.com", password: 'kikoulol')
patrick.skip_confirmation!
patrick.save!

football  = Sport.create!(name: "Football")
handball  = Sport.create!(name: "Handball")
tennis    = Sport.create!(name: "Tennis")

foot_club_machin  = Location.create!(address: "18 rue massena", city: "lille", postcode: "59000", name: "club machin")
foot_club_wzm     = Location.create!(address: "104 rue nationale", city: "lille", postcode: "59000", name: "club de wazemmes")
tennis_club       = Location.create!(address: "place rihour", city: "lille", postcode: "59000", name: "Tennis club de rihour")

foot_club_machin.location_sports.create(sport: football)
foot_club_wzm.location_sports.create(sport: football)
tennis_club.location_sports.create(sport: tennis)

Activity.create!(location: Location.all.sample, captain: samir, group: samir.group, name: "foot", number_of_players: 5, date: Date.today, open: true, sport: football)
Activity.create!(location: Location.all.sample, captain: paul, group: paul.group, name: "yolo", number_of_players: 10, date: Date.today, open: true, sport: football)
Activity.create!(location: Location.all.sample, captain: franck, group: franck.group, name: "On se détend", number_of_players: 4, date: Date.today, open: true, sport: handball)
Activity.create!(location: Location.all.sample, captain: patrick, group: patrick.group, name: "foot", number_of_players: 5, date: Date.today, open: false, sport: handball)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

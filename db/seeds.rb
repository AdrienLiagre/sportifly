# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  Group.destroy_all
  User.destroy_all
  Activity.destroy_all
  Sport.destroy_all
  Location.destroy_all
end

edhec_lille = Group.create!(name: 'Edhec', description: "Groupe des étudiants de l'Edhec Grande Ecole et Msc, pour plus de fun et de sport !", email_domain_name: 'edhec.com')
hec = Group.create!(name: 'HEC', description: "Groupe des étudiants de HEC", email_domain_name: 'hec.com')

samir = User.create!(name: "Samir Benflouka", group: edhec_lille, phone_number: '0675847374', age: 22, crew: "Ad’lib", email: "samir.benflouka@edhec.com", password: 'kikoulol')
User.create!(name: "Olivia Legrand", group: edhec_lille, phone_number: '0675847355', age: 20, crew: "OJO", email: "olivia.legrand@edhec.com", password: 'kikoulol')
User.create!(name: "Mathieu Plus", group: hec, phone_number: '0675847322', age: 20, crew: "OJO", email: "mathieu.plus@hec.com", password: 'kikoulol')
paul = User.create!(name: "Paul Franco", group: edhec_lille, phone_number: '0675847333', age: 23, crew: "CCE", email: "paul.franco@edhec.com", password: 'kikoulol')
User.create!(name: "Christine Adou", group: hec, phone_number: '0675847334', age: 22, crew: "SBC", email: "christine.adou@hec.com", password: 'kikoulol')
User.create!(name: "Aurélie Nakeseizan", group: edhec_lille, phone_number: '0675841174', age: 22, crew: "SBC", email: "aurelie.nakeseizan@edhec.com", password: 'kikoulol')
franck = User.create!(name: "Frank Saucisse", group: hec, phone_number: '0675846674', age: 23, crew: "Chti", email: "frank.saucisse@hec.com", password: 'kikoulol')
User.create!(name: "Arthur Mathias", group: edhec_lille, phone_number: '0675657374', age: 22, crew: "Chti", email: "arthur.mathias@edhec.com", password: 'kikoulol')
User.create!(name: "Francine Blanche", group: hec, phone_number: '0648847374', age: 22, crew: "Raid", email: "francine.blanche@hec.com", password: 'kikoulol')
patrick = User.create!(name: "Patrick Sebastien", group: edhec_lille, phone_number: '0675245374', age: 21, crew: "Musicall", email: "patrick.sebastien@edhec.com", password: 'kikoulol')

football = Sport.create!(name: "Football")
handball = Sport.create!(name: "Handball")

Location.create!(address: "18 rue massena", city: "lille", postcode: "59000", name: "club machin")
Location.create!(address: "104 rue nationale", city: "lille", postcode: "59000", name: "club de wazemmes")
Location.create!(address: "place rihour", city: "lille", postcode: "59000", name: "Tennis club de rihour")

Activity.create!(location: Location.all.sample, captain: samir, group: samir.group, name: "foot", number_of_players: 5, date: Date.today, open: true, sport: football)
Activity.create!(location: Location.all.sample, captain: paul, group: paul.group, name: "yolo", number_of_players: 10, date: Date.today, open: true, sport: football)
Activity.create!(location: Location.all.sample, captain: franck, group: franck.group, name: "On se détend", number_of_players: 4, date: Date.today, open: true, sport: handball)
Activity.create!(location: Location.all.sample, captain: patrick, group: patrick.group, name: "foot", number_of_players: 5, date: Date.today, open: false, sport: handball)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

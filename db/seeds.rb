# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

edhec = Group.create!(name: 'Edhec', description: "Groupe des étudiants de l'Edhec Grande Ecole et Msc, pour plus de fun et de sport !", email_domain_name: 'edhec.com')

User.create!(name: "Samir Benflouka", group: edhec, phone_number: '0675847374', age: 22, crew: "Ad’lib", email: "samir.benflouka@edhec.com", password: 'kikoulol')
User.create!(name: "Olivia Legrand", group: edhec, phone_number: '0675847355', age: 20, crew: "OJO", email: "olivia.legrand@edhec.com", password: 'kikoulol')
User.create!(name: "Mathieu Plus", group: edhec, phone_number: '0675847322', age: 20, crew: "OJO", email: "mathieu.plus@edhec.com", password: 'kikoulol')
User.create!(name: "Paul Franco", group: edhec, phone_number: '0675847333', age: 23, crew: "CCE", email: "paul.franco@edhec.com", password: 'kikoulol')
User.create!(name: "Christine Adou", group: edhec, phone_number: '0675847334', age: 22, crew: "SBC", email: "christine.adou@edhec.com", password: 'kikoulol')
User.create!(name: "Aurélie Nakeseizan", group: edhec, phone_number: '0675841174', age: 22, crew: "SBC", email: "aurelie.nakeseizan@edhec.com", password: 'kikoulol')
User.create!(name: "Frank Saucisse", group: edhec, phone_number: '0675846674', age: 23, crew: "Chti", email: "frank.saucisse@edhec.com", password: 'kikoulol')
User.create!(name: "Arthur Mathias", group: edhec, phone_number: '0675657374', age: 22, crew: "Chti", email: "arthur.mathias@edhec.com", password: 'kikoulol')
User.create!(name: "Francine Blanche", group: edhec, phone_number: '0648847374', age: 22, crew: "Raid", email: "francine.blanche@edhec.com", password: 'kikoulol')
User.create!(name: "Patrick Sebastein", group: edhec, phone_number: '0675245374', age: 21, crew: "Musicall", email: "patrick.sebastien@edhec.com", password: 'kikoulol')

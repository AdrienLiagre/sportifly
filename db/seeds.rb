# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.create(name: 'Edhec', description: "Groupe des étudiants de l'Edhec Grande Ecole et Msc, pour plus de fun et de sport !", email_domain_name: 'edhec.com')

User.create(name: "Samir Benflouka", group_id: '1', age: '22', crew: "Ad’lib", email: "samir.benflouka@edhec.com")
User.create(name: "Olivia Legrand", group_id: '1', age: '20', crew: "OJO", email: "olivia.legrand@edhec.com")
User.create(name: "Mathieu Plus", group_id: '1', age: '20', crew: "OJO", email: "mathieu.plus@edhec.com")
User.create(name: "Paul Franco", group_id: '1', age: '23', crew: "CCE", email: "paul.franco@edhec.com")
User.create(name: "Christine Adou", group_id: '1', age: '22', crew: "SBC", email: "christine.adou@edhec.com")
User.create(name: "Aurélie Nakeseizan", group_id: '1', age: '22', crew: "SBC", email: "aurelie.nakeseizan@edhec.com")
User.create(name: "Frank Saucisse", group_id: '1', age: '23', crew: "Chti", email: "frank.saucisse@edhec.com")
User.create(name: "Arthur Mathias", group_id: '1', age: '22', crew: "Chti", email: "arthur.mathias@edhec.com")
User.create(name: "Francine Blanche", group_id: '1', age: '22', crew: "Raid", email: "francine.blanche@edhec.com")
User.create(name: "Patrick Sebastein", group_id: '1', age: '21', crew: "Musicall", email: "patrick.sebastien@edhec.com")

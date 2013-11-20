# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.create(first_name: "Alfred", last_name: "Admin", password: "adminadmin", email: "admin@admin.com", permission_level: 5)
  User.create(first_name: "Alfred2", last_name: "Admin2", password: "adminadmin", email: "admin2@admin.com", permission_level: 5)
  User.create(first_name: "Samuel", last_name: "Jackson", password:"director", email: "director@director.com", permission_level: 4)
  User.create(first_name: "Shaniqua", last_name: "Jones", password:"siteleader", email: "siteldr@siteldr.com", permission_level: 3)
  User.create(first_name: "Momma", last_name: "Dadda", password: "bigdaddy", email:  "parent@parent.com", permission_level: 2)
  User.create(first_name: "Kyle", last_name: "Broflovski", password: "ericsucks", email: "camper@camper.com", permission_level: 1)



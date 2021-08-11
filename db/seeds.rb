# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Regions
Region.create(name: "North Seattle")
Region.create(name: "Downtown Seattle")
Region.create(name: "Ashlands")
Region.create(name: "Issaquah Alps")
Region.create(name: "Eastside")

# Users

User.create(username: "kingsley113", password: "12345", display_name: "Cameron")
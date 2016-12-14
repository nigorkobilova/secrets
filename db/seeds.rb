# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name:"Nigora", email:"nkobilova@gmail.com", password:"password")
User.create(name:"Malika", email:"malika@gmail.com", password:"password")
User.create(name:"Sabina", email:"sabina@gmail.com", password:"password")

Secret.create(content:"This is 1 user's first secret", user: User.first)
Secret.create(content:"This is 2 user's first secret", user: User.second)
Secret.create(content:"This is 2 user's second secret", user: User.second)
Secret.create(content:"This is 3 user's first secret", user: User.third)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(
  email: "admin@ruptiva.com.br",
  first_name: "Admin",
  last_name: "Ruptiva",
  password: "ruptiva",
  password_confirmation: "ruptiva",
  role: :admin
)

15.times do
    password = Faker::Internet.password
    
    User.create(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name, 
      password: password,
      password_confirmation: password, 
      role: :user
    )
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create!(username:"matthewwho", email:"matthewwho@me.com", password:"123")

10.times do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

users = User.all

15.times do
  Question.create!(title: Faker::Company.catch_phrase, content: Faker::Lorem.paragraph(2), user: users.sample)
end

questions = Question.all

20.times do
  Answer.create!(content: Faker::Lorem.paragraph, user: users.sample, question: questions.sample)
end

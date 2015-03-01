# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create!(username:"matthewwho", email:"matthewwho@me.com", password:"123")
User.create!(username:"kevin", email:"kevin@mail.com", password:"password")

10.times do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

users = User.all

15.times do
  Question.create!(title: Faker::Company.catch_phrase, content: Faker::Lorem.paragraph(10), user: users.sample)
end

questions = Question.all

10.times do
  Vote.create(voteable: questions.sample, user: users.sample)
end


20.times do
  Answer.create!(content: Faker::Lorem.paragraph, user: users.sample, question: questions.sample)
end

answers = Answer.all

10.times do 
  Vote.create(voteable: answers.sample, user: users.sample)
end

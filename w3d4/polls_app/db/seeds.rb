# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do
  
  user1 = User.create!(username: 'bob')
  user2 = User.create!(username: 'john')
  user3 = User.create!(username: 'mary')
  
  poll1 = Poll.create!(author_id: 1, title: "Food")
  poll2 = Poll.create!(author_id: 2, title: "Sports")
  
  q1 = Question.create!(body: "What's your Favorite Food?", poll_id: 1)
  q2 = Question.create!(body: "What's your Favorite Sport?", poll_id: 2)
  
  o1 = AnswerChoice.create!(option: "Chinese", question_id: 1)
  o2 = AnswerChoice.create!(option: "Mexican", question_id: 1)
  o3 = AnswerChoice.create!(option: "American", question_id: 1)
  o4 = AnswerChoice.create!(option: "Vietnamese", question_id: 1)
  o5 = AnswerChoice.create!(option: "Soccer", question_id: 2)
  o6 = AnswerChoice.create!(option: "Basketball", question_id: 2)
  o7 = AnswerChoice.create!(option: "Baseball", question_id: 2)
  o8 = AnswerChoice.create!(option: "Other", question_id: 2)
  
  r1 = Response.create!(option_id: 1, user_id: 1)
  r2 = Response.create!(option_id: 5, user_id: 1)
  r3 = Response.create!(option_id: 3, user_id: 2)
  r4 = Response.create!(option_id: 1, user_id: 3)
  r5 = Response.create!(option_id: 7, user_id: 3)
  r6 = Response.create!(option_id: 6, user_id: 2)

end
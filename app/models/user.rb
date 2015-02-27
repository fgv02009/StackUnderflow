class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions
  has_many :votes
  has_many :voted_answers, through: :votes, source: :voteable, source_type: "Answer"
  has_many :voted_questions, through: :votes, source: :voteable, source_type: "Question"


  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end

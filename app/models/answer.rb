class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :voters, through: :votes, source: :user

  validates_presence_of :content, :question_id, :user_id
end

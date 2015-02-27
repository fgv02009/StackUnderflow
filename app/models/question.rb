class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy # Cascading destroy
  has_many :votes, as: :voteable
  has_many :voters, through: :votes, source: :user

  validates_presence_of :content, :title, :user_id
end

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :content, :title, :user_id
end

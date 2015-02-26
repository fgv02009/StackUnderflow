class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates_presence_of :content, :question_id, :user_id
end

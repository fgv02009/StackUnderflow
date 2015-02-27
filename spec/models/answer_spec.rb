require 'rails_helper'

describe Answer do
  let(:answer) { Answer.new }
  let(:new_user) { User.create(username: "kyoon105hope", email: "mail@mail.com", password: "password") }

  describe "validations" do
    it "is invalid when there is no content" do
      answer.content = nil
      answer.valid?
      expect(answer.errors[:content]).to_not be_empty
    end

    it "valid when there is a question attached to the answer" do
      new_question = Question.create!(title: "hello", content: "Super awesome", user: new_user)
      answer.question = new_question
      answer.valid?
      expect(answer.errors[:question_id]).to be_empty
    end

    it "is made when there is a user attached to the question" do
      answer.user = new_user
      answer.valid?
      expect(answer.errors[:user_id]).to be_empty
    end 
  end


end

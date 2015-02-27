require 'rails_helper'

describe Question do
  let(:question) { Question.new }

  describe "validations" do
    it "is invalid when there is no content" do
      question.content = nil
      question.valid?
      expect(question.errors[:content]).to_not be_empty
    end

    it "is invalid when there is no title" do
      question.title = nil
      question.valid?
      expect(question.errors[:title]).to_not be_empty
    end

    it "is made when there is a user attached to the question" do
      new_user = User.create(username: "kyoon105hope", email: "mail@mail.com", password: "password")
      question.user = new_user
      question.valid?
      expect(question.errors[:user_id]).to be_empty
    end

    it "cascade delete answers of a question" do
      new_user = User.create(username: "kyoon105hope", email: "mail@mail.com", password: "password")
        question = Question.create(title: "heroku", content: "a;lsdkfja;lsdkjfa;kldsjf", user: new_user)
        3.times do 
          Answer.create(content: "super duper content", question_id: question.id, user_id: new_user.id)
        end
        question.destroy
        expect(Answer.count).to eq(0)
    end    
  end


end

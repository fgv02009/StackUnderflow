require 'rails_helper'

describe User do 
  let(:user) { User.new }

  describe "validations" do
    it "is invalid when there is no username" do
      user.email = 'sarahikeda@gmail.com'
      user.valid?
      expect(user.errors[:username]).to_not be_empty
    end

    it "is invalid when there is no email" do
      user.username = 'kyoon105hope'
      user.valid?
      expect(user.errors[:email]).to_not be_empty
    end

    it "is invalid when username is duplicative" do
      new_user = User.new(username: "kyoon105hope", email: "mail@mail.com", password: "password")
      new_user.save
      user.username = "kyoon105hope"
      user.valid?
      expect(user.errors[:username]).to_not be_empty
    end

    it "is invalid when email is duplicative" do
      new_user = User.new(username: "kyoon105hope", email: "mail@mail.com", password: "password")
      new_user.save
      user.email = "mail@mail.com"
      user.valid?
      expect(user.errors[:email]).to_not be_empty
    end

    it "is invalid when password is absent" do
      user.username = "kyoon105hope"
      user.email = "mail@mail.com"
      user.valid?
      expect(user.errors[:password]).to_not be_empty
    end

    it "is invalid when passwords do not match" do
      user.password = "password"
      user.password_confirmation = "notright"
      user.valid?
      expect(user.errors[:password_confirmation]).to_not be_empty
    end
  end 

end

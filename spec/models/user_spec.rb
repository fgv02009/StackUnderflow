require 'rails_helper'

describe User do 
  let(:user) { User.new }

  describe "validations" do
    it "is invalid when there is no username" do

    end

    it "is invalid when there is no email" do
    end

    it "is invalid when username is duplicative" do
    end

    it "is invalid when email is duplicative" do
    end

    it "is invalid when password is absent" do
    end

    it "is invalid when passwords do not match" do
    end
  end 

end

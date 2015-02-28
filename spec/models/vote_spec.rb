require 'rails_helper'

describe Vote do
  let(:vote) {Vote.new}

  describe 'validations' do
    it "is invalid when there is no voteable (question or answer)" do
      vote.valid?
      expect(vote.errors[:voteable]).to_not be_empty
    end
  end
end

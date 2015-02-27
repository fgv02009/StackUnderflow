require 'rails_helper'

feature 'visitor visits website' do
  scenario "sees a list of 10 questions" do
    visit '/'
    expect(page).to have_content("10 Most Recent Questions")
  end

  scenario "can see a specific questions show page" do
    user = User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
    question = Question.create!(title: "most recent q", content: "winning" ,user: user)
    visit '/'
    click_link("most recent q")
    expect(page).to have_content("winning")
  end
end
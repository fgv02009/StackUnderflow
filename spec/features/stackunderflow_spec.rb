require 'rails_helper'

feature 'Visitor visits website' do
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

  xscenario "visitor can't add a question" do
  end
end

feature 'User visits website ' do
  before(:all) do
    visit '/'
    click_link("login")
    user = User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
    #FILL IN FORM
  end
  xscenario "can login" do
    expect(page).to have_content(user.username)
  end
  
  scenario "sees a list of 10 questions" do
    expect(page).to have_content("10 Most Recent Questions")
  end

  scenario "can create a new question" do
    click_button("Ask a Question")
    within ("#new_question") do
      fill_in 'title', :with => 'New Fake Title'
      fill_in 'content', :with => 'New Fake Content'
    end
    click_button ("Submit New Question")
    expect("#table").to have_content('New Fake Content')
  end
end
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

  # Kevin Sunday Edit
  scenario "visitor can't add a question" do
    visit '/'
    expect(page).to_not have_content("Ask A Question")
  end

  # Kevin Sunday Edit
  scenario "can see all current questions", js: true do
    visit '/'
    click_link("Show All Current Questions")
    expect(find('.nav-tabs')).to have_css("li#show-all.active")
  end
end

feature 'Logged in user visits website ' do
  given(:user)  {User.create!(username: "Bob Rajput", email: Faker::Internet.email, password: "123")}

  scenario "can login" do
    visit '/'
    click_link("Login")
    within(".new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button("Login")
    end

    expect(page).to have_content(user.username)
  end
  
  scenario "sees a list of 10 questions" do
    visit '/'
    click_link("Login")
    within(".new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button("Login")
    end
    expect(page).to have_content("10 Most Recent Questions")
  end

  scenario "can create a new question", js: true do
    visit '/'
    click_link("Login")
    within(".new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button("Login")
    end

    click_link("Ask a Question")
    within ("#new_question") do
      fill_in 'title', :with => 'New Fake Title'
      fill_in 'content', :with => 'New Fake Content'
    end

    click_button ("Submit New Question")

    # require 'pry'; binding.pry
    expect(find('table')).to have_content('New Fake Title')
  end
end

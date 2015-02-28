require 'rails_helper'

feature 'Can click question and view answer' do
  given(:user)  {User.create!(username: "Bob Rajput", email: Faker::Internet.email, password: "123")}
  given(:question) {Question.create!(user: user, title: 'new fake title', content: 'new fake content')}
  given(:answer) {Answer.create!(content: 'fake answer content', user: user, question: question)}
  scenario "show page populates", js: true do
    visit '/'
    click_link("Login")
    within(".new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button("Login")
    end
  require 'pry'; binding.pry
    click_link("new fake title")
      expect(page).to have_content('fake answer content')
  end
end

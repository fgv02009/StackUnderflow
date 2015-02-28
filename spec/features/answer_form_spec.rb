require 'rails_helper'

feature 'Can click question and view answer' do
  given(:user)  {User.create!(username: "Bob Rajput", email: Faker::Internet.email, password: "123")}
  scenario "show page populates", js: true do
    generate_q
    click_link("New Fake Title")
      expect(page).to have_content('New Fake Content')
  end

  scenario "can answer question", js: true do
    generate_q
    click_link("New Fake Title")
    click_link("Answer Question")
    expect(find('#newanswer')).to have_css("#answer_content")
  end

  scenario "can submit answer", js: true do
   generate_q
    click_link("New Fake Title")
    click_link("Answer Question")
    expect(find('#newanswer')).to have_css("#answer_content")
    within (".new_answer") do
      fill_in 'Type your answer here.', :with => 'New Fake Answer'
    end
    click_button("Submit New Answer")
    expect(page).to_not have_css("#answer_content")
    expect(page).to have_content("New Fake Answer")
  end
end


def generate_q
 visit '/'
    click_link("Login")
    within(".new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button("Login")
    end
    click_link("Ask a Question")
      within (".new_question") do
        fill_in 'title', :with => 'New Fake Title'
        fill_in 'content', :with => 'New Fake Content'
      end
    click_button ("Submit New Question")
end
 

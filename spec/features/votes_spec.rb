require 'rails_helper'

feature 'User can vote' do
  given(:user)  {User.create!(username: "Bob Rajput", email: Faker::Internet.email, password: "123")}
  scenario "sees a thumbs up button", js: true do
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
    expect(find('table')).to have_css('a i.fa-thumbs-up')
  end

  scenario 'can click thumbs up and increase vote count', js: true do
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
    # click_link("<i class ='fa fa-thumbs-up'>")
    find(:xpath, "//a[@href='/create/question/vote?question_id=1']").click
    expect(find('table')).to have_content('1')
  end
  
  scenario 'can click thumbs down after voting thumbs up', js: true do
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
    # click_link("<i class ='fa fa-thumbs-up'>")
    find(:xpath, "//a[@href='/create/question/vote?question_id=1']").click
    find(:xpath, "//a[@href='/destroy/question/vote?question_id=1']").click
    expect(find('table')).to have_content('0')
  end  
end


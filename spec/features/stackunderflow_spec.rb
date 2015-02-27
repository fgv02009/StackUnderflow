require 'rails_helper'

feature 'visitor visits website' do
  scenario "sees a list of 10 questions" do
    visit '/'
    expect(page).to have_content("10 Most Recent Questions")
  end
end
require 'spec_helper'
feature 'Listing repos' do

  before do
    login_with :github, user_info
    puts User.first.username
  end

  scenario "Visit a users page" do
    visit "/mcawesome"
    page.should have_content 'No repos'
  end
end

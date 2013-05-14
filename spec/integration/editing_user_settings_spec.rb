require 'spec_helper'
feature 'Editing User Settings' do

  background do
    pending
    login_with :github, user_info
    visit '/settings'
  end

  scenario "with new Users params" do
    pending
    fill_in "Name", with: "Gary McTest"
    fill_in "Email", with: 'gary@mctest.com'
    click_button 'Save'
    page.should have_content("Updated settings")
  end

end

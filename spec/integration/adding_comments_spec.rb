require 'spec_helper'
feature "Repos should have comments" do
  before do
    FactoryGirl.create(:user)
    FactoryGirl.create(:repo)
  end

  scenario "Trying to add a comment while not signed in" do
    visit '/mctesterson/test_repo'
    page.should_not have_content("Post comment")
  end

  scenario "Add a comment while logged in" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    fill_in 'comment_body', :with => "Hey this is awesome!"
    click_button "Post comment"
  end

end

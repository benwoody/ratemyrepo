require 'spec_helper'
feature "Users can delete comments" do
  before do
    FactoryGirl.create(:user)
    FactoryGirl.create(:repo)
  end

  scenario "Trying to delete a comment while not signed in" do
    visit '/mctesterson/test_repo'
    page.should_not have_link("x")
  end

  scenario "Delete a comment you own" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    fill_in 'comment_body', :with => "Hey this is awesome!"
    click_button "Post comment"
    page.should have_link("x")
  end

end

require 'spec_helper'
feature "Updating a Review and a User has already reviewed" do

  background do
    FactoryGirl.create(:user)
    FactoryGirl.create(:repo)
    FactoryGirl.create(:review)
    login_with :github, user_info
    visit '/mctesterson/test_repo'
  end

  # User is allowed only 1 review. Adding after
  # Reviewing only #updates the Review.
  scenario "fields should contain previous review" do
    find_field('Comment').value.should eq 'This is one nice ass repo!'
  end

  scenario "old review should be removed from view" do
    page.select("4", :from => 'Rating')
    fill_in "Comment", with: "This repo rocks!"
    click_button "Rate"
    page.should have_content "This repo rocks!"
    page.should_not have_content "This is one nice ass repo!"
  end
end

require 'spec_helper'
feature "Adding a Review" do

  background do
    FactoryGirl.create(:user)
    @repo = FactoryGirl.create(:repo)
  end

  # User must sign in/up to review
  scenario "while not logged in" do
    visit '/mctesterson/test_repo'
    page.should have_content('Sign in to Rate this Repo!')
  end

  scenario "while logged in" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    page.should have_content('Rate this Repo')
  end

  # Review needs at least a Star Rating
  scenario "with no rating or comment" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    click_button "Rate"
    page.should have_content "Review not added"
  end

  # User can add a Star Rating only
  scenario "with only a rating" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    page.select("4", :from => 'Rating')
    click_button "Rate"
    page.should have_content "Review added"
  end

  # User adds both Star Rating and Comment
  scenario "with a rating and comment" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    page.select("4", :from => 'Rating')
    fill_in "Comment", with: "This repo rocks!"
    click_button "Rate"
    page.should have_content "Review added"
  end

  # User is allowed only 1 review. Adding after
  # Reviewing only #updates the Review.
  scenario "if User has already reviewed" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    page.should have_content "Update Review"
  end

end
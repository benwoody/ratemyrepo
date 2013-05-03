require 'spec_helper'
feature "Adding a Rating" do

  before do
    FactoryGirl.create(:user)
    FactoryGirl.create(:repo)
  end

  scenario "while not logged in" do
    visit '/mctesterson/test_repo'
    page.should_not have_content('Rate this Repo')
  end

  scenario "while logged in" do
    login_with :github, user_info
    visit '/mctesterson/test_repo'
    page.should have_content('Rate this Repo')
  end

end

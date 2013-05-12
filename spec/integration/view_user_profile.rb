require 'spec_helper'
feature 'Visiting a User profile' do

  background do
    FactoryGirl.create(:user)
  end

  scenario "with no repos" do
    visit "/mctesterson"
    page.should have_content 'No repos'
  end

  scenario "Visit a users page with repos" do
    FactoryGirl.create(:repo)
    visit "/mctesterson"
    page.should have_content 'test_repo'
  end

end

feature 'and clicking a specific Repo link' do

  background do
    @user = FactoryGirl.create(:user)
    @repo = FactoryGirl.create(:repo)
  end

  scenario 'Link should go to repo_path' do
    visit '/mctesterson/'
    click_link 'test_repo'
    page.current_path.should == repo_path(@user,@repo)
  end

end

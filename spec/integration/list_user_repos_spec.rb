require 'spec_helper'
feature 'Listing repos' do

  before do
    FactoryGirl.create(:user)
  end

  scenario "Visit a users page with no repos" do
    visit "/mctesterson"
    page.should have_content 'No repos'
  end

  scenario "Visit a users page with repos" do
    FactoryGirl.create(:repo)
    visit "/mctesterson"
    page.should have_content 'test_repo'
  end
end

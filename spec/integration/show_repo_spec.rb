require 'spec_helper'
feature 'Show a Repo' do

  background do
    FactoryGirl.create(:user)
    FactoryGirl.create(:repo)
  end

  scenario "Visiting a Repo page should have certain attributes" do
    visit '/mctesterson/test_repo'
    page.should have_content 'test_repo'
  end
end

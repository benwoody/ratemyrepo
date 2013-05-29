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

  scenario "with 10 or more comments" do
    add_reviews 11
    visit '/mctesterson/test_repo'
    page.should have_content "1 2 Next › Last »"
  end

  def add_reviews num
    num.times do |n|
      id = n+2
      FactoryGirl.create(:user, id: id)
      FactoryGirl.create(:review, user_id: id)
    end
  end
end

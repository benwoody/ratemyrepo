require 'spec_helper'
feature "Added Repos should be shown in Settings" do

  before do
    login_with :github, user_info
    FactoryGirl.create(:user)
    FactoryGirl.create(:repo)
    stub_list_of_repos
    visit '/settings/repos'
  end

  scenario 'Page should show added repos' do
    page.should have_content "test_repo"
  end
end

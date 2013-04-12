require 'spec_helper'
feature "Add Github Repos in settings" do

  before do
    login_with :github, user_info
    stub_list_of_repos
    stub_single_repo
    visit '/'
    click_link "Settings"
    click_link "Repos"
  end

  scenario 'Clicking Repos should show a dropdown of Github Repos' do
    page.should have_content('ratemyrepo.github.combrewerydb2chatr')
  end

  scenario 'Selecting a repo and clicking Add should add a Repo' do
    page.select("brewerydb2", :from => 'Name')
    click_button "Add"
    current_path.should == "/#{username}/brewerydb2"
    page.should have_content "Repo added"
  end

end

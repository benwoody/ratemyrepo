require 'spec_helper'
feature "Adding a Github repo through #settings" do

  background do
    login_with :github, user_info
    stub_list_of_repos
    stub_single_repo
    visit '/settings/repos'
  end

  scenario 'should show a dropdown of Github Repos' do
    page.should have_content('ratemyrepo.github.combrewerydb2chatr')
  end

  scenario 'after selecting a repo' do
    page.select("brewerydb2", :from => 'Name')
    click_button "Add"
    current_path.should == "/#{username}/brewerydb2"
    page.should have_content "Repo added"
  end

end

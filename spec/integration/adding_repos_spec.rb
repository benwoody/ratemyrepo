require 'spec_helper'
feature "Add Github Repos in settings" do

  before do
    login_with :github, user_info
    ret = File.open("#{Rails.root}/spec/support/github_return.json")
    stub_request(:get, "https://api.github.com/repositories").
         with(:headers => {'Content-Type'=>'application/json', 'User-Agent'=>'Github Ruby Gem 0.9.4'}).
         to_return(:status => 200, :body => ret, :headers => {})

    visit '/settings/repos'
  end

  scenario 'Clicking Repos should show a list of Github Repos' do
    page.should have_select("Name", :options => ['ratemyrepo.github.com','brewerydb2','chatr'])
  end

end

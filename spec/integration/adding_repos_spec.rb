require 'spec_helper'
feature "Add Github Repos in settings" do

  before do
    login_with :github, user_info
    visit '/settings'
  end

  scenario 'Clicking Repos should show a list of Github Repos' do

  end

end

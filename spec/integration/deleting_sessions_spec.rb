require 'spec_helper'
feature 'Signing out' do

  before do
    login_with :github, user_info
  end

  scenario 'using the Signout link' do
    visit '/'
    click_link 'Sign out'
    page.should have_content 'Signed out'
    logged_in?.should == false
  end

end

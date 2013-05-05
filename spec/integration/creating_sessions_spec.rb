require 'spec_helper'
feature 'Signing in/up using sign in link' do

  scenario "with invalid credentials" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit '/'
    click_link 'Sign in'
    page.should have_content "Authentication Failed"
    current_path.should == '/'
    logged_in?.should == false
  end

  scenario "with valid credentials" do
    OmniAuth.config.add_mock :github, user_info
    visit '/'
    click_on 'Sign in'
    logged_in?.should == true
  end

  scenario "with valid credentials after creating an account" do
    OmniAuth.config.add_mock :github, user_info
    FactoryGirl.create(:user)
    User.count.should == 1
    visit '/'
    click_on 'Sign in'
    logged_in?.should == true
  end

end

feature 'Signing in directly' do

  background do
    login_with :github, user_info
    visit '/'
    click_link 'Sign out'
  end

  scenario 'using Github' do
    login_with :github, user_info
    page.should have_content 'Signed in'
    logged_in?.should == true
  end

  scenario 'with bad Github credentials' do
    login_with :github, :invalid_credentials
    page.should have_content 'Authentication Failed'
    logged_in?.should == false
  end

end

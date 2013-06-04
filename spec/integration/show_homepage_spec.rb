require 'spec_helper'
feature 'Viewing the rootpage' do
  background do
    visit '/'
  end
  scenario 'as a guest user' do
    page.should have_content('Sign in via Github!')
  end
  scenario 'while logged in' do
    login_with :github, user_info
    visit '/'
    page.should have_content('')
  end
end


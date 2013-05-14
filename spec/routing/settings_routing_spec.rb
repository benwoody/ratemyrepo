require 'spec_helper'
describe SettingsController do
  it 'should have a #user route' do
    pending
    get('/settings').should route_to(
      controller: 'settings',
      action:     'show')
  end

  it 'should allow for updates' do
    post('/settings').should route_to(
      controller: 'settings',
      action:     'update_user')
  end

  it 'should have an #add_repo route' do
    get('/settings/repos').should route_to(
      controller: 'settings',
      action:     'repos')
  end

  it 'should allow for adding new repos' do
    post('/settings/repos').should route_to(
      controller: 'settings',
      action:     'add_repo')
  end
end

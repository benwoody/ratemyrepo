require 'spec_helper'
describe SettingsController do
  it 'should have a #index route' do
    get('/settings').should route_to(
      :controller => 'settings',
      :action     => 'index')
  end

  it 'should allow for updates' do
    post('/settings').should route_to(
      :controller => 'settings',
      :action     => 'update')
  end
end

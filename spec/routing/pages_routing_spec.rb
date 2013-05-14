require 'spec_helper'
describe PagesController do
  it 'should have a Home route' do
    get('/').should route_to(
      controller: 'pages',
      action:     'home')
  end

  it 'should have an About route' do
    get('/about').should route_to(
      controller: 'pages',
      action:     'about')
  end
end

require 'spec_helper'
describe UsersController do
  it 'should have a #show route' do
    get('/mctesterson').should route_to(
      controller: 'users',
      action:     'show',
      username:   'mctesterson')
  end
end

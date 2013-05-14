require 'spec_helper'
describe ReposController do
  it 'should have a #show route' do
    get('/mctesterson/test_repo').should route_to(
      controller: 'repos',
      action:     'show',
      username:   'mctesterson',
      repo:       'test_repo')
  end
end

FactoryGirl.define do
  factory :repo do
    id 1
    user_id 1
    name 'test_repo'
    fork false
    description 'my test repo'
    url 'http://github.com/mctesterson/test_repo'
  end
end

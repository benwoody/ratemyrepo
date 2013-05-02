FactoryGirl.define do
  factory :user do
    id 1
    uid '12345'
    username 'mctesterson'
    fullname 'Test McTesterson'
    email 'test@mctesterson.com'
    bio 'Hey, I test things, jack!'
  end
end

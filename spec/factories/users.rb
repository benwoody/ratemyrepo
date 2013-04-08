FactoryGirl.define do
  factory :user do
    uid '12345'
    username 'mctesterson'
    fullname 'Test McTesterson'
    email 'test@mctesterson.com'
    bio 'Hey, I test things, jack!'
  end
end

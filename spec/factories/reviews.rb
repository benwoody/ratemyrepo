FactoryGirl.define do
  factory :review do
    user_id 1
    repo_id 1
    rating 5
    comment "This is one nice ass repo!"
  end
end

FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.sentence(10) }
    user
    post
  end
end

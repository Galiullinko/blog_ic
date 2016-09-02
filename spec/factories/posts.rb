FactoryGirl.define do
  factory :post do
    title
    text { Faker::Lorem.sentence(10) }
    user
  end
end

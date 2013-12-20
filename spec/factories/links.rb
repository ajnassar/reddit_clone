# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title Faker::Name.title
    url Faker::Internet.url
    user_id 1
    body Faker::Lorem.paragraph
  end
end

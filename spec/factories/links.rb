# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title "MyString"
    url "MyString"
    user_id 1
    body "MyText"
  end
end

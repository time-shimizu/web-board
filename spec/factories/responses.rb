FactoryBot.define do
  factory :response do
    user_name "MyString"
    content "MyString"
    association :topic
  end
end

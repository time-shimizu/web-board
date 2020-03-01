FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "sample#{n}@example.com"}
    password "foobar"
  end
end

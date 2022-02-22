FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "jason#{n}@gmail.com" }
    password { 'password' }
  end
end

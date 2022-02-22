FactoryBot.define do
  factory :transaction do
    action { "MyString" }
    amount { 1.5 }
    stock { "MyString" }
    quantity { 1.5 }
    user { nil }
  end
end

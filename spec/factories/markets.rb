FactoryBot.define do
  factory :market do
    stock { 'AAPL' }
    price { 164.32 }
    company { 'Apple Inc.' }
  end
end

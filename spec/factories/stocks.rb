FactoryBot.define do
  factory :stock do
    symbol { 'AAPL' }
    price { 164.32 }
    company { 'Apple Inc.' }
  end
end

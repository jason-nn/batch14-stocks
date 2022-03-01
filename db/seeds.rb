# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(email: 'jason@admin.com', password: 'password', admin: true)

jason =
  User.create(
    email: 'jason.ho@obf.ateneo.edu',
    password: 'password',
    admin: false,
  )

client =
  IEX::Api::Client.new(
    publishable_token: 'pk_714d506665774bd4911a522edde00754',
    secret_token: 'sk_5a1c52d71b9a4d1d880b1f44646e44af',
    endpoint: 'https://cloud.iexapis.com/v1',
  )

stocks = client.stock_market_list(:mostactive)

stocks.each do |stock|
  Stock.create(
    symbol: stock.symbol,
    price: stock.latest_price,
    company: stock.company_name,
  )
end

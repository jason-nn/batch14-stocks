# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './services/iex_service_object.rb'

client = IEXServiceObject.new.client

admin =
  User.create(
    first_name: 'Jason',
    last_name: 'Admin',
    email: 'jason@admin.com',
    password: 'password',
    admin: true,
  )

jason =
  User.create(
    first_name: 'Jason',
    last_name: 'Ho',
    email: 'jason.ho@obf.ateneo.edu',
    password: 'password',
    admin: false,
  )

stocks = client.stock_market_list(:mostactive)

stocks.each do |stock|
  Stock.create(
    symbol: stock.symbol,
    price: stock.latest_price,
    company: stock.company_name,
  )
end

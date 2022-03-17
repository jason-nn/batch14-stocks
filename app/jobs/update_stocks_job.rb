require './services/iex_service_object.rb'

class UpdateStocksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    client = IEXServiceObject.new.client
    stocks = client.stock_market_list(:mostactive)

    stocks.each do |stock|
      db_stock = Stock.find_by_symbol(stock.symbol)

      if db_stock == nil
        Stock.create(
          symbol: stock.symbol,
          price: stock.latest_price,
          company: stock.company_name,
          change_percent: stock.change_percent,
        )
      else
        db_stock.update(price: stock.latest_price)
        db_stock.update(change_percent: stock.change_percent)
      end
    end

    self.class.set(wait: 1.hour).perform_later
  end
end

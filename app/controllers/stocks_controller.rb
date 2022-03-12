class StocksController < ApplicationController
  before_action :approved_only

  def index
    @stocks = Stock.all
    @selected = 'stocks'
  end

  def show
    @stock = Stock.find(params[:id])
    @selected = 'stocks'
  end
end

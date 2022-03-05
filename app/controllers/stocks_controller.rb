class StocksController < ApplicationController
  before_action :approved_only

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end
end

class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    Transaction.all
  end
end

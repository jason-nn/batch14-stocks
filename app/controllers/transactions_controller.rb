class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin
      @transactions = Transaction.all
    else
      @transactions = Transaction.where(user_id: current_user.id)
    end
  end

  def cashin
    #
  end

  def buy
    #
  end

  def sell
    #
  end

  private

  def transaction_params
    params.require(:transaction).permit(:action, :amount)
  end

  def set_portfolio
    portfolio = {}

    transactions = Transaction.where(user_id: current_user.id)
    transactions.each do |transaction|
      portfolio[transaction.stock] = 0 if !portfolio[transaction.stock]
      portfolio[transaction.stock] += transaction.quantity if transaction
        .action == 'purchase'
      portfolio[transaction.stock] -= transaction.quantity if transaction
        .action == 'sale'
    end

    @portfolio = portfolio
  end

  def set_balance
    @balance = Transaction.where(user_id: current_user.id).pluck(:amount).sum
  end
end

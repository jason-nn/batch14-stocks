class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home]
  before_action :set_portfolio, only: %i[portfolio]
  before_action :set_balance, only: %i[account]

  def home
    #
    if user_signed_in?
      if current_user.admin
        redirect_to users_path
      else
        redirect_to stocks_path
      end
    end
  end

  def portfolio
    #
  end

  def account
    #
  end

  private

  def set_portfolio
    portfolio = {}

    transactions = Transaction.where(user_id: current_user.id)
    transactions.each do |transaction|
      portfolio[transaction.stock_id] = 0 if !portfolio[transaction.stock_id] &&
        transaction.action != 'cash in'
      portfolio[transaction.stock_id] += transaction.quantity if transaction
        .action == 'purchase'
      portfolio[transaction.stock_id] -= transaction.quantity if transaction
        .action == 'sale'
    end

    @portfolio = portfolio
  end

  def set_balance
    @balance = Transaction.where(user_id: current_user.id).pluck(:amount).sum
  end
end

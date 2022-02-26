class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home]
  before_action :set_user
  before_action :set_portfolio, only: %i[portfolio]
  before_action :set_balance, only: %i[account]

  def home
    #
  end

  def portfolio
    #
  end

  def account
    #
  end

  private

  def set_user
    @user = current_user
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

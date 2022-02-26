class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home]

  def home
    #
  end

  def portfolio
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

  def account
    @balance = Transaction.where(user_id: current_user.id).pluck(:amount).sum
  end
end

class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_balance, only: %i[buy]
  before_action :set_portfolio, only: %i[sell]

  def index
    if current_user.admin
      @transactions = Transaction.all
    else
      @transactions = Transaction.where(user_id: current_user.id)
    end
  end

  def cashin
    @transaction = current_user.transactions.new
  end

  def cashin_post
    @transaction =
      current_user.transactions.new(transaction_params.merge(action: 'cash in'))

    if @transaction.save
      redirect_to account_path, notice: 'Successfully cashed in'
    else
      render :cashin
    end
  end

  def buy
    stock = Stock.find(params[:id])
    amount = stock.price * params[:transaction][:quantity].to_i
    if amount < @balance
      @transaction =
        current_user.transactions.new(
          transaction_params.merge(
            action: 'purchase',
            stock_id: stock.id,
            price: stock.price,
            amount: amount * -1,
          ),
        )

      if @transaction.save
        redirect_to stock_path(stock.id), notice: 'Successfully bought stock'
      else
        redirect_to stock_path(stock.id), notice: 'Error'
      end
    else
      redirect_to stock_path(stock.id), notice: 'Insufficient funds'
    end
  end

  def sell
    stock = Stock.find(params[:id])
    quantity = params[:transaction][:quantity].to_i
    amount = stock.price * quantity
    if @portfolio[stock.id] && @portfolio[stock.id] > quantity
      @transaction =
        current_user.transactions.new(
          transaction_params.merge(
            action: 'sale',
            stock_id: stock.id,
            price: stock.price,
            amount: amount,
          ),
        )

      if @transaction.save
        redirect_to stock_path(stock.id), notice: 'Successfully sold stock'
      else
        redirect_to stock_path(stock.id), notice: 'Error'
      end
    else
      redirect_to stock_path(stock.id), notice: 'Insufficient stock'
    end
    #
  end

  private

  def transaction_params
    params.require(:transaction).permit(:action, :amount, :quantity)
  end

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

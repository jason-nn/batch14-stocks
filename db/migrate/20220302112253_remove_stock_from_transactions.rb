class RemoveStockFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :stock, :string
  end
end

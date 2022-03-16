class AddChangePercentToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :change_percent, :float
  end
end

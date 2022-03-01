class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :action
      t.float :amount
      t.bigint :stock_id
      t.float :quantity
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

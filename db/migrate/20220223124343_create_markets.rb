class CreateMarkets < ActiveRecord::Migration[6.1]
  def change
    create_table :markets do |t|
      t.string :stock
      t.float :price
      t.string :company

      t.timestamps
    end
  end
end

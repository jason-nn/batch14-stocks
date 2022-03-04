class ChangeSurnameToLastname < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :surname, :last_name
  end
end

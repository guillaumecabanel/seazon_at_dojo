class AddExpensesPrefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pro_expenses, :boolean, default: false
  end
end

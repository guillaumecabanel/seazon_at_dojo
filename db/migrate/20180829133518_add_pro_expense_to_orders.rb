class AddProExpenseToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pro_expense, :boolean
  end
end

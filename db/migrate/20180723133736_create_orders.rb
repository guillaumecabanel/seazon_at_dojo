class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :paid_at
      t.references :serving, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end

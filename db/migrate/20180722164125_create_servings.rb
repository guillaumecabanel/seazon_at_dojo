class CreateServings < ActiveRecord::Migration[5.2]
  def change
    create_table :servings do |t|
      t.datetime :best_before
      t.float :price
      t.integer :quantity
      t.references :meal, foreign_key: true

      t.timestamps null: false
    end
  end
end

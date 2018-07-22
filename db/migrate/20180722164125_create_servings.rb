class CreateServings < ActiveRecord::Migration[5.2]
  def change
    create_table :servings do |t|
      t.datetime :best_before
      t.float :price
      t.integer :quantity
      t.references :meal, foreign_key: true
    end
  end
end

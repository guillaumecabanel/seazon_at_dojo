class AddDetailsToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :ingredients, :text
    add_column :meals, :allergens, :string
  end
end

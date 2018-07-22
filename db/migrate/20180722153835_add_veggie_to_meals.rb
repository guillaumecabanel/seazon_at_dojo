class AddVeggieToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :veggie, :boolean, default: false
  end
end

class AddPhotoToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :photo, :string
  end
end

class EditRatingsInRecipes < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :rating, :average_rating
  end
end

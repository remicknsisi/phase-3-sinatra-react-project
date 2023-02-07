class AddIsfavoritedBooleanToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :isFavorited, :boolean
  end
end

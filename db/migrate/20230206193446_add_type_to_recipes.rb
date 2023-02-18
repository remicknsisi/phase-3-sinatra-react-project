class AddTypeToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :type, :string
  end
end

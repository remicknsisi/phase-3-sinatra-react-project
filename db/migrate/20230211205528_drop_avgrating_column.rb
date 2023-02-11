class DropAvgratingColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :average_rating
  end
end

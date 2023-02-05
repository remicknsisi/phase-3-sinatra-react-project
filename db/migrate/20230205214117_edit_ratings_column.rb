class EditRatingsColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :ratings, :recipe_id, :chef_id
  end
end

class RevertRatingsColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :ratings, :chef_id, :recipe_id
  end
end

class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instructions
      t.string :image_url
      t.integer :hours
      t.string :ingredients
      t.integer :rating
      t.integer :chef_id
    end
  end
end

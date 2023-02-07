class AddImageToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :image, :string
  end
end

class AddBioToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :bio, :string
  end
end

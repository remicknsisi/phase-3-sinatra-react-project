class AddYearsExperienceToChefs < ActiveRecord::Migration[6.1]
  def change
    add_column :chefs, :years_cooking, :integer
  end
end

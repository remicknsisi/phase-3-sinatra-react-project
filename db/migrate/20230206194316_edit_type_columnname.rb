class EditTypeColumnname < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :type, :cuisine_type
  end
end

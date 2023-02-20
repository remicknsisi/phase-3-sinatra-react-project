class DeleteForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :chef_id
  end
end

class AddAuthorNameToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :author_name, :string
  end
end

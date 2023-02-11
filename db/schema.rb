ActiveRecord::Schema.define(version: 2023_02_09_204420) do

  create_table "chefs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "image"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
    t.string "image_url"
    t.integer "hours"
    t.string "ingredients"
    t.integer "average_rating"
    t.integer "chef_id"
    t.string "cuisine_type"
    t.boolean "isFavorited"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.integer "recipe_id"
    t.string "author_name"
  end

end

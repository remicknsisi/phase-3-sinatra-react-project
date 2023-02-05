# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_05_214347) do

  create_table "chefs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "chef_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
    t.string "image_url"
    t.integer "hours"
    t.string "ingredients"
    t.integer "rating"
    t.integer "chef_id"
  end

end
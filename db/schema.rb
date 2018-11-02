# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181102134609) do

  create_table "figure_titles", force: :cascade do |t|
    t.integer "title_id"
    t.integer "figure_id"
  end

  add_index "figure_titles", ["figure_id"], name: "index_figure_titles_on_figure_id"
  add_index "figure_titles", ["title_id"], name: "index_figure_titles_on_title_id"

  create_table "figures", force: :cascade do |t|
    t.string "name"
  end

  create_table "landmarks", force: :cascade do |t|
    t.string  "name"
    t.integer "figure_id"
    t.integer "year_completed"
  end

  add_index "landmarks", ["figure_id"], name: "index_landmarks_on_figure_id"

  create_table "titles", force: :cascade do |t|
    t.string "name"
  end

end

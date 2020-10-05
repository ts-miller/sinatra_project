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

ActiveRecord::Schema.define(version: 20201005114455) do

  create_table "games", force: :cascade do |t|
    t.string  "name"
    t.string  "quality"
    t.integer "resolution_x"
    t.integer "resolution_y"
    t.integer "avg_fps"
    t.integer "pc_id"
  end

  create_table "pcs", force: :cascade do |t|
    t.string  "cpu_brand"
    t.string  "cpu_model"
    t.integer "ram"
    t.string  "gpu_brand"
    t.string  "gpu_model"
    t.string  "storage_type"
    t.string  "storage_size"
    t.string  "psu"
    t.string  "psu_watts"
    t.boolean "psu_80plus"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
  end

end

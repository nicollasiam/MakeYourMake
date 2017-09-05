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

ActiveRecord::Schema.define(version: 20170905155835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.integer  "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
    t.index ["make_id"], name: "index_images_on_make_id", using: :btree
  end

  create_table "make_types", force: :cascade do |t|
    t.integer  "make_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_make_types_on_make_id", using: :btree
    t.index ["type_id"], name: "index_make_types_on_type_id", using: :btree
  end

  create_table "makes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "likes_count"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_makes_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "score"
    t.string   "title"
    t.text     "content"
    t.integer  "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["make_id"], name: "index_reviews_on_make_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "artistic_name"
    t.string   "telephone_number"
    t.string   "address"
    t.boolean  "admin",                                  null: false
    t.boolean  "professional",           default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "images", "makes"
  add_foreign_key "make_types", "makes"
  add_foreign_key "make_types", "types"
  add_foreign_key "makes", "users"
  add_foreign_key "reviews", "makes"
  add_foreign_key "reviews", "users"
end

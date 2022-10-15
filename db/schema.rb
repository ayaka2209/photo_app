ActiveRecord::Schema.define(version: 2022_10_13_083329) do

  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text "image"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

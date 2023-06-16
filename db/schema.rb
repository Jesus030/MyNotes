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

ActiveRecord::Schema[7.0].define(version: 2023_06_16_013450) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "collection_notes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "topic"
    t.integer "user_id", null: false
    t.integer "note_id", null: false
    t.string "Username"
    t.index ["note_id"], name: "index_collection_notes_on_note_id"
    t.index ["user_id"], name: "index_collection_notes_on_user_id"
  end

  create_table "collections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "topic"
    t.integer "notes_id"
    t.integer "user_id"
    t.index ["notes_id"], name: "index_collections_on_notes_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_friends_on_email", unique: true
    t.index ["reset_password_token"], name: "index_friends_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "user_username"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "status", default: "pending"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_homes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_homes_on_reset_password_token", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "topic"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "user_id", null: false
    t.boolean "share"
    t.integer "share_id"
    t.integer "collection_id"
    t.index ["collection_id"], name: "index_notes_on_collection_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "relation_notes_collections", force: :cascade do |t|
    t.integer "note_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_relation_notes_collections_on_note_id"
    t.index ["user_id"], name: "index_relation_notes_collections_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "Username"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role"
    t.integer "friend_id"
    t.string "authentication_token"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "current_sign_in_ip"
    t.datetime "last_sign_in_ip"
    t.integer "sign_in_count", default: 0
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["friend_id"], name: "index_users_on_friend_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "collection_notes", "notes"
  add_foreign_key "collection_notes", "users"
  add_foreign_key "notes", "collections"
  add_foreign_key "notes", "users"
  add_foreign_key "relation_notes_collections", "notes"
  add_foreign_key "relation_notes_collections", "users"
  add_foreign_key "users", "friends"
end

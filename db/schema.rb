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

ActiveRecord::Schema[7.0].define(version: 2023_01_12_235037) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.text "username"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "contents", force: :cascade do |t|
    t.text "content_path"
    t.bigint "folder_id", null: false
    t.bigint "metadatum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_contents_on_folder_id"
    t.index ["metadatum_id"], name: "index_contents_on_metadatum_id"
  end

  create_table "folders", force: :cascade do |t|
    t.text "folder_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metadata", force: :cascade do |t|
    t.integer "FOIA_ID"
    t.bigint "folder_id", null: false
    t.text "local_id"
    t.text "status"
    t.text "record_collection"
    t.text "office_origin"
    t.text "series"
    t.text "subseries"
    t.text "box_type"
    t.integer "box_number"
    t.text "note_field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_metadata_on_folder_id"
  end

  create_table "multiuploads", force: :cascade do |t|
    t.text "path"
    t.text "series"
    t.text "subseries"
    t.text "local_id"
    t.text "status"
    t.text "record_collection"
    t.text "office_origin"
    t.text "box_type"
    t.integer "box_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
  end

  create_table "sessions", force: :cascade do |t|
    t.text "otp_hash"
    t.text "login_hash"
    t.text "session_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.integer "FOIA_ID"
    t.text "folder_title"
    t.text "local_id"
    t.text "status"
    t.text "record_collection"
    t.text "office_origin"
    t.text "series"
    t.text "subseries"
    t.text "box_type"
    t.integer "box_number"
    t.text "note_field"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contents", "folders"
  add_foreign_key "contents", "metadata"
  add_foreign_key "metadata", "folders"
end

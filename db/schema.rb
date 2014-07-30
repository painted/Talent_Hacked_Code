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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140729142427) do
=======
ActiveRecord::Schema.define(version: 20140729194717) do
>>>>>>> b2a3c13bb3c38c8dc9b20836f4f446cb02d5104b

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "industry"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "address"
    t.string   "github"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedinPublicUrl"
    t.string   "avatarUrl"
    t.string   "provider"
    t.string   "uid"
    t.string   "contact"
    t.string   "mobile"
    t.string   "role"
    t.date     "dob"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "companyBio"
    t.boolean  "verified",               default: false, null: false
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.string   "phone"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id", using: :btree

  create_table "developers", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatarUrl"
    t.string   "linkedinPublicUrl"
    t.text     "address"
    t.date     "dob"
    t.string   "twitter"
    t.string   "phone"
    t.string   "website"
    t.string   "github"
    t.string   "facebook"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "dayrate"
    t.text     "bio"
    t.boolean  "verified",               default: false, null: false
  end

  add_index "developers", ["email"], name: "index_developers_on_email", unique: true, using: :btree
  add_index "developers", ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true, using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.integer  "skill_id"
    t.integer  "developer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "levels", ["developer_id"], name: "index_levels_on_developer_id", using: :btree
  add_index "levels", ["project_id"], name: "index_levels_on_project_id", using: :btree
  add_index "levels", ["skill_id"], name: "index_levels_on_skill_id", using: :btree

  create_table "proficiencies", force: true do |t|
    t.integer  "project_id"
    t.integer  "developer_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proficiencies", ["developer_id"], name: "index_proficiencies_on_developer_id", using: :btree
  add_index "proficiencies", ["language_id"], name: "index_proficiencies_on_language_id", using: :btree
  add_index "proficiencies", ["project_id"], name: "index_proficiencies_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.date     "deadline"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "budget"
    t.string   "projectIndustry"
    t.text     "description"
    t.boolean  "verified",        default: false, null: false
    t.string   "status"
  end

  add_index "projects", ["contact_id"], name: "index_projects_on_contact_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "developer_id"
    t.integer  "project_id"
    t.string   "status",       default: "pending"

  end

end

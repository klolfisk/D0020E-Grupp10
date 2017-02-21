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

ActiveRecord::Schema.define(version: 20170221162430) do

  create_table "containers", force: :cascade do |t|
    t.string   "name"
    t.string   "dockercontainer_id"
    t.string   "image"
    t.string   "command"
    t.string   "status"
    t.string   "exposed_port"
    t.string   "host_port"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "containertags", force: :cascade do |t|
    t.integer  "container_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["container_id"], name: "index_containertags_on_container_id"
    t.index ["tag_id"], name: "index_containertags_on_tag_id"
  end

  create_table "serverhascontainers", force: :cascade do |t|
    t.integer  "container_id"
    t.integer  "server_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["container_id"], name: "index_serverhascontainers_on_container_id"
    t.index ["server_id"], name: "index_serverhascontainers_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "port"
    t.boolean  "running"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servertags", force: :cascade do |t|
    t.integer  "server_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_servertags_on_server_id"
    t.index ["tag_id"], name: "index_servertags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

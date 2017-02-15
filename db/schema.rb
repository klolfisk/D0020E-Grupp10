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

ActiveRecord::Schema.define(version: 20170215161241) do

  create_table "containers", force: :cascade do |t|
    t.string   "containerid"
    t.string   "name"
    t.string   "image"
    t.string   "command"
    t.integer  "exposedport"
    t.integer  "hostport"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.integer  "port"
    t.string   "status"
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

end

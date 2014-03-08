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

ActiveRecord::Schema.define(version: 20140308132553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.string   "name",       null: false
    t.string   "uuid",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], :name => "index_groups_on_name"
    t.index ["uuid"], :name => "index_groups_on_uuid", :unique => true
  end

  create_table "users", force: true do |t|
    t.string   "display_name",                        null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  create_table "group_memberships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], :name => "fk__group_memberships_group_id"
    t.index ["user_id", "group_id"], :name => "index_group_memberships_on_user_id_and_group_id", :unique => true
    t.index ["user_id"], :name => "fk__group_memberships_user_id"
    t.foreign_key ["group_id"], "groups", ["id"], :on_update => :cascade, :on_delete => :cascade, :name => "fk_group_memberships_group_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :cascade, :on_delete => :cascade, :name => "fk_group_memberships_user_id"
  end

  create_table "motions", force: true do |t|
    t.text     "text",       null: false
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], :name => "fk__motions_group_id"
    t.index ["user_id"], :name => "fk__motions_user_id"
    t.foreign_key ["group_id"], "groups", ["id"], :on_update => :cascade, :on_delete => :cascade, :name => "fk_motions_group_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :cascade, :on_delete => :restrict, :name => "fk_motions_user_id"
  end

  create_table "votes", force: true do |t|
    t.integer  "motion_id",  null: false
    t.integer  "user_id",    null: false
    t.string   "response"
    t.string   "vote_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["motion_id", "user_id"], :name => "index_votes_on_motion_id_and_user_id", :unique => true
    t.index ["motion_id"], :name => "fk__votes_motion_id"
    t.index ["user_id"], :name => "fk__votes_user_id"
    t.index ["vote_token"], :name => "index_votes_on_vote_token", :unique => true
    t.foreign_key ["motion_id"], "motions", ["id"], :on_update => :cascade, :on_delete => :cascade, :name => "fk_votes_motion_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :cascade, :on_delete => :restrict, :name => "fk_votes_user_id"
  end

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131016123323) do

  create_table "appointments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "role"
    t.integer  "score"
    t.string   "team"
    t.integer  "player_number"
    t.boolean  "won"
    t.integer  "remark",        :default => 0
  end

  add_index "appointments", ["user_id"], :name => "index_appointments_on_user_id"

  create_table "games", :force => true do |t|
    t.string   "description"
    t.string   "result"
    t.string   "best_player"
    t.string   "game_status",         :default => "open"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "game_ref"
    t.boolean  "first_killed_sherif"
  end

  create_table "managers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.integer  "appointment_id"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "round_number"
    t.boolean  "kill"
    t.boolean  "vote"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "alias"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

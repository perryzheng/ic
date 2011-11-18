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

ActiveRecord::Schema.define(:version => 20111118082921) do

  create_table "bible_verses", :force => true do |t|
    t.text     "verse_content"
    t.string   "label"
    t.integer  "bullet_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mp3_url"
  end

  create_table "bullet_points", :force => true do |t|
    t.string   "header"
    t.text     "bullet_point_content"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "title"
    t.text     "lesson_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapter_id"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.boolean  "esl"
    t.string   "country"
    t.string   "start_date"
    t.string   "end_date"
    t.boolean  "english_help"
    t.boolean  "living_help"
    t.boolean  "fun_help"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "esl"
    t.string   "country"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "english_help"
    t.string   "living_help"
    t.string   "fun_help"
    t.string   "notes"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end

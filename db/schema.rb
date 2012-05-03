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

ActiveRecord::Schema.define(:version => 20120503232418) do

  create_table "attachments", :force => true do |t|
    t.integer  "budget_id"
    t.string   "name"
    t.string   "label"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "budgets", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "starts"
    t.integer  "ends"
    t.string   "rolls"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lines", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "line_number"
    t.string   "name"
    t.float    "subtotal"
    t.string   "type"
    t.integer  "order"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.string   "contents"
    t.integer  "budget_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sublines", :force => true do |t|
    t.integer  "line_id"
    t.integer  "line_number"
    t.string   "name"
    t.float    "subtotal"
    t.string   "type"
    t.integer  "order"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "subline_id"
    t.string   "name"
    t.float    "subtotal"
    t.integer  "order"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

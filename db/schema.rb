# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090710152002) do

  create_table "callmes", :force => true do |t|
    t.string   "phone"
    t.string   "zip"
    t.boolean  "confirmed",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "callmes", ["phone"], :name => "index_callmes_on_phone"
  add_index "callmes", ["zip"], :name => "index_callmes_on_zip"

  create_table "pets", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "dog_or_cat",    :default => "Dog"
    t.string   "lost_or_found", :default => "Lost"
    t.string   "sex",           :default => "Male"
    t.string   "color"
    t.string   "weight"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twimls", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "verbs", :force => true do |t|
    t.integer  "twiml_id"
    t.integer  "position"
    t.string   "action"
    t.string   "action_type"
    t.string   "text"
    t.string   "verb_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

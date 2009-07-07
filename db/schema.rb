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

ActiveRecord::Schema.define(:version => 20090706213057) do

  create_table "twimls", :force => true do |t|
    t.string   "name"
    t.boolean  "gather"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "verbs", :force => true do |t|
    t.integer  "twiml_id"
    t.string   "voice"
    t.string   "action"
    t.string   "text"
    t.string   "verb_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

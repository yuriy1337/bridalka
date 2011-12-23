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

ActiveRecord::Schema.define(:version => 20111223190551) do

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "zip_code"
    t.date     "wedding_date"
    t.string   "wedding_location"
    t.string   "ceremony_venue"
    t.string   "reception_venue"
    t.string   "referent"
    t.string   "referent_name"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

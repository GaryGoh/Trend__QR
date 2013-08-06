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

ActiveRecord::Schema.define(:version => 20130806213713) do

  create_table "cables", :force => true do |t|
    t.integer  "server_id"
    t.string   "to_end"
    t.string   "from_nic"
    t.string   "to_nic"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "QR_code"
    t.string   "IP"
    t.string   "IDR"
    t.integer  "CPU"
    t.integer  "RAM"
    t.integer  "Storage"
    t.string   "MAC"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "extension"
  end

end

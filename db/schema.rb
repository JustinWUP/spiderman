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

ActiveRecord::Schema.define(:version => 20130226164951) do

  create_table "jobs", :force => true do |t|
    t.string   "link"
    t.string   "city"
    t.string   "jobboard"
    t.string   "company"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "posted"
  end

  create_table "results", :force => true do |t|
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.string   "pageslike"
    t.string   "element"
    t.string   "target"
    t.string   "replacement"
    t.string   "pagesregex"
    t.string   "linkcell"
    t.string   "companycell"
    t.string   "citycell"
    t.string   "postedcell"
  end

end

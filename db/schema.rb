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

ActiveRecord::Schema.define(:version => 20120330200343) do

  create_table "dim_people", :id => false, :force => true do |t|
    t.integer "person_id",            :null => false
    t.string  "gender"
    t.integer "year_of_birth"
    t.integer "month_of_birth"
    t.integer "day_of_birth"
    t.string  "race"
    t.string  "county"
    t.boolean "multi_racial"
    t.integer "age_rounded_in_years"
  end

  create_table "fct_visits", :id => false, :force => true do |t|
    t.integer "child_id"
    t.integer "year_last_visit"
    t.integer "month_last_visit"
    t.integer "day_last_visit"
    t.integer "days_since_last_visit"
  end

  add_index "fct_visits", ["child_id"], :name => "idx_fct_visits_child_id"

  create_table "orders", :force => true do |t|
    t.string   "customer"
    t.string   "product"
    t.integer  "quantity"
    t.string   "status",     :default => "OPEN"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

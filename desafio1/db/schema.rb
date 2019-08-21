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

ActiveRecord::Schema.define(version: 20190821171215) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "description"
    t.decimal "price",       precision: 5, scale: 2
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "address"
    t.string "name"
  end

  create_table "purchase_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "items_id"
    t.integer "purchases_id"
    t.index ["items_id"], name: "index_purchase_items_on_items_id", using: :btree
    t.index ["purchases_id"], name: "index_purchase_items_on_purchases_id", using: :btree
  end

  create_table "purchasers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "count"
    t.integer "purchasers_id"
    t.integer "merchants_id"
    t.index ["merchants_id"], name: "index_purchases_on_merchants_id", using: :btree
    t.index ["purchasers_id"], name: "index_purchases_on_purchasers_id", using: :btree
  end

  add_foreign_key "purchases", "merchants", column: "merchants_id"
  add_foreign_key "purchases", "purchasers", column: "purchasers_id"
end

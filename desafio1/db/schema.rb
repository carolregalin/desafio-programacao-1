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

ActiveRecord::Schema.define(version: 20190821125316) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "item_description"
    t.decimal "item_price",       precision: 5, scale: 2
  end

  create_table "merchants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "merchant_address"
    t.string "merchant_name"
  end

  create_table "purchase_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "purchase_id"
    t.integer "item_id"
    t.index ["item_id"], name: "fk_rails_125ca55cab", using: :btree
    t.index ["purchase_id"], name: "fk_rails_62c1aa0bbe", using: :btree
  end

  create_table "purchasers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "purchaser_id"
    t.integer "merchant_id"
    t.index ["merchant_id"], name: "fk_rails_a83f94a7bf", using: :btree
    t.index ["purchaser_id"], name: "fk_rails_81dfc754d2", using: :btree
  end

  add_foreign_key "purchase_items", "items"
  add_foreign_key "purchase_items", "purchases"
  add_foreign_key "purchases", "merchants"
  add_foreign_key "purchases", "purchasers"
end

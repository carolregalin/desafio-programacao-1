class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :purchasers do |p|
      p.string :name
    end

    create_table :items do  |i|
      i.string :item_description
      i.decimal :item_price, precision: 5, scale: 2
    end

    create_table :merchants do |m|
      m.string :merchant_address
      m.string :merchant_name
    end

    create_table :purchases do |p|
      p.integer :purchaser_id
      p.integer :merchant_id
    end

    create_table :purchase_items do |p|
      p.integer :purchase_id
      p.integer :item_id
    end

    add_foreign_key :purchase_items, :items
    add_foreign_key :purchase_items, :purchases
    add_foreign_key :purchases, :purchasers
    add_foreign_key :purchases, :merchants
  end
end

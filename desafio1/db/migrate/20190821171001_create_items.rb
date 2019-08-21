class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do  |i|
      i.string :item_description
      i.decimal :item_price, precision: 5, scale: 2
    end
  end
end

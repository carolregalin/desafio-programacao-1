class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do  |i|
      i.string :description
      i.decimal :price, precision: 5, scale: 2
    end
  end
end

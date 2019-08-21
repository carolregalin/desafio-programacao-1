class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |p|
      p.integer :count
    end
  end
end

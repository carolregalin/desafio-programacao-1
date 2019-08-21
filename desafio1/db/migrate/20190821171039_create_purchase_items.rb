class CreatePurchaseItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_items do |p|
      p.belongs_to :item
      p.belongs_to :purchase
    end
  end
end

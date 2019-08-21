class CreatePurchasers < ActiveRecord::Migration[5.0]
  def change
    create_table :purchasers do |p|
      p.string :name
    end
  end
end

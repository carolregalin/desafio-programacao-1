class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |m|
      m.string :merchant_address
      m.string :merchant_name
    end
  end
end

class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |m|
      m.string :address
      m.string :name
    end
  end
end

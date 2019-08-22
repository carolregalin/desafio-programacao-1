class Purchase < ApplicationRecord
    has_many :purchase_items
    has_many :items, through: :purchase_item
    has_one :purchaser
    has_one :merchant

    def self.create_purchases(purchases)
        purchases.each do |purchase|
            item = Item.find_or_create_by(description: purchase[:item][:description], price: purchase[:item][:price])

            purchaser = Purchaser.find_or_create_by(name: purchase[:purchaser][:name])

            merchant = Merchant.find_or_create_by(address: purchase[:merchant][:address], name: purchase[:merchant][:name])

            p = Purchase.new({
                count: purchase.count,
                merchants_id: merchant.id,
                purchasers_id: purchaser.id
            })

            p.save

            p.purchase_items.create(item: item)
        end
    end
end

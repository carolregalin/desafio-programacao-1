class Purchase < ApplicationRecord
    has_many :purchase_items
    has_many :items, through: :purchase_items
    has_one :purchaser
    has_one :merchant
end

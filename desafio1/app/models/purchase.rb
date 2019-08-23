class Purchase < ApplicationRecord
    has_many :purchase_items
    has_many :items, through: :purchase_item
    has_one :purchaser
    has_one :merchant
    validates :count, numericality: true
end

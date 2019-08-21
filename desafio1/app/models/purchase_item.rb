class PurchaseItem < ApplicationRecord
    belongs_to :items
    belongs_to :purchases
end
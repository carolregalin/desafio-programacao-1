class PurchaseItem < ApplicationRecord
    belongs_to :item
    belongs_to :purchase
    validates :item, :purchase, presence: true
end
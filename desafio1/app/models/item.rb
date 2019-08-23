class Item < ApplicationRecord
  has_many :purchase_items
  has_many :purchases, through: :purchase_items
  validates :description, presence: true
  validates :price, presence: true, numericality: true, greater_than_or_equal_to: 0
end

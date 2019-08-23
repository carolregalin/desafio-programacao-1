class Item < ApplicationRecord
  has_many :purchase_items
  has_many :purchases, through: :purchase_items
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end

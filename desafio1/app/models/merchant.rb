class Merchant < ApplicationRecord
    has_many :purchases
    validates :address, :name, presence: true
end

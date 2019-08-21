class Item < ApplicationRecord
   has_many :purchase_items
   has_many :items, througth: purchase_items
end


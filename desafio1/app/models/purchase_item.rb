class PurchaseController < ApplicationController
    belongs_to :item
    belongs_to :purchase
end
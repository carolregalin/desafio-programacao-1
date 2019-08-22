class AddReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :purchasers, foreign_key: true
    add_reference :purchases, :merchants, foreign_key: true
  end
end

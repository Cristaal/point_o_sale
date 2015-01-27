class AddProductIdsColumnToPurchases < ActiveRecord::Migration
  def change
    add_column(:purchases, :product_ids, :integer)
  end
end

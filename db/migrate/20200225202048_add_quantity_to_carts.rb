class AddQuantityToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :itemquantity, :integer
  end
end

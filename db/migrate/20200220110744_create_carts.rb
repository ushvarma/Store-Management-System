class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.string :name
      t.string :cartItem
      t.references :user
      t.references :item

      t.timestamps
    end
  end
end

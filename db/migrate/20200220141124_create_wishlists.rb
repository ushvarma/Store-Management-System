class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.string :wname
      t.string :wishlistItem

      t.timestamps
    end
  end
end

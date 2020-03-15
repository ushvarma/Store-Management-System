class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :userId
      t.integer :orderItemId
      t.string :transactionId
      t.integer :quantity
      t.float :unitPrice
      t.float :orderPrice

      t.timestamps
    end
  end
end

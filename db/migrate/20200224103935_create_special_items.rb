class CreateSpecialItems < ActiveRecord::Migration[6.0]
  def change
    create_table :special_items do |t|
      t.integer :specialUserId
      t.integer :specialItemid
      t.string :specialItemTransactionId
      t.integer :specialQuantity
      t.float :refundAmount
      t.integer :specialItemStatus

      t.timestamps
    end
  end
end

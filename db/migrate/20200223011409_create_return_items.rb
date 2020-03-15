class CreateReturnItems < ActiveRecord::Migration[6.0]
  def change
    create_table :return_items do |t|
      t.integer :returnuserId
      t.integer :returnItemid
      t.string :returnTransactionId
      t.integer :returnQuantity
      t.float :refundAmount

      t.timestamps
    end
  end
end

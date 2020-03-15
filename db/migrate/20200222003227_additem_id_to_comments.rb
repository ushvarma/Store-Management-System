class AdditemIdToComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      #t.integer :item_id
      #t.index :item_id 
    end
  end
end

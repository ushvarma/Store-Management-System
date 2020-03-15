class ModifyItems1 < ActiveRecord::Migration[6.0]
  def change
    change_table :items do |t|
      t.float :price
      t.integer :tax_slab
      t.integer :remaining_quantity  
      t.text :description
      #t.boolean :special_item  
      #t.boolean :age_restricted
    end
  end
end

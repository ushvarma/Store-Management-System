class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :quantity  
      t.references :user

      t.timestamps
    end
  end
end

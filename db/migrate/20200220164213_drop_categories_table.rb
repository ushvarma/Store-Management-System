class DropCategoriesTable < ActiveRecord::Migration[6.0]
  def change
  	drop_table :adminpages
  end
end

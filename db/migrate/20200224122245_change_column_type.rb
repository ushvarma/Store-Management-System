class ChangeColumnType < ActiveRecord::Migration[6.0]
  def up
    change_column :special_items, :specialItemStatus, :integer
  end

  def down
    change_column :special_items, :specialItemStatus, :boolean
  end
end

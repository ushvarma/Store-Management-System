class AddStatusToReturnItems < ActiveRecord::Migration[6.0]
  def change
    add_column :return_items, :returnStatus, :integer
  end
end

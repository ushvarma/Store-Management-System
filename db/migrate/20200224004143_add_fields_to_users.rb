class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
    add_column :users, :credit_card_number, :integer
    add_column :users, :name_on_card, :string
    add_column :users, :expiration_date, :date
    add_column :users, :CVV, :integer
  end
end

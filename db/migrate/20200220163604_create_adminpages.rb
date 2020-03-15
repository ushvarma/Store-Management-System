class CreateAdminpages < ActiveRecord::Migration[6.0]
  def change
    create_table :adminpages do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :phone_number
      t.string :date_of_birth
      t.text :address
      t.integer :credit_card_number
      t.string :name_on_card
      t.string :expiration_date
      t.integer :CVV

      t.timestamps
    end
  end
end

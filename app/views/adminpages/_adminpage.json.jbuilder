json.extract! adminpage, :id, :name, :email, :password, :phone_number, :date_of_birth, :address, :credit_card_number, :name_on_card, :expiration_date, :CVV, :created_at, :updated_at
json.url adminpage_url(adminpage, format: :json)

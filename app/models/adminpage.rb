class Adminpage < ApplicationRecord
 	
 	attr_readonly :mail_id, :password	
    validates :CVV,
    	presence: true,
    	length: {maximum: 3},
    	on: :edit,
    	allow_nil: false
    validates :Credit_card_number,
    	presence: true,
    	length: {maximum: 16},
    	on: :edit,
    	allow_nil: false
end

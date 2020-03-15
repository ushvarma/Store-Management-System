class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :calculate_counts

    protected

    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :current_password, :date_of_birth, :phone_number, :address, :credit_card_number, :name_on_card, :expiration_date, :CVV) }
         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :date_of_birth, :phone_number, :address, :credit_card_number, :name_on_card, :expiration_date, :CVV) }
    end

    def calculate_counts
        if current_user
        #order_count = Order.where(["userId = ?", current_user.id]).select(:transactionId).map(&:transactionId).uniq.size
        #cart_count = Cart.where(["name = ?", current_user.email]).size
        #wishlist_count = Wishlist.where(["wname = ?", current_user.email]).size
        #return order_count, cart_count, wishlist_count
        end
    end
    
    def calculate_age(date)
        dob_to_i = date.to_s.gsub!(/[^0-9A-Za-z]/, '').to_i   #Date of birth in YYYYMMDD format
        current_date = DateTime.now.to_s[0..9].gsub!(/[^0-9A-Za-z]/, '').to_i   #Current date in YYYYMMDD format
        return ((current_date - dob_to_i) * 0.0001).to_i
    end

    def discounts(total, userId)
        dob = User.where(:id => userId).last.date_of_birth
        discount = 0
        message = ""
        if dob
            age = calculate_age(dob)
            if(age >= 65)
                message = "(10%)"
                discount = (total * 0.10).round(2)
            end
        end
        return discount, message
    end

    def add_to_special_requests(userId, item, tid)
        status = false
        @specialOrder = SpecialItem.new(:specialUserId => userId, :specialItemid => item.id, :specialItemTransactionId => tid, :specialQuantity => 1, :refundAmount => item.price, :specialItemStatus => 0)
        if @specialOrder.save
            status = true
        end
        return status
    end
    
    def check_restricted_item(item, userId)
        if item.age_restricted
            dob = User.where(["id = ?", userId]).last.date_of_birth
            if dob.nil?
                return true, "Please enter age details in your profile to proceed with this transaction."
            else
                age = calculate_age(dob)
                if age < 18
                    return true, "The age criteria is not met for the transaction. Please remove the item from cart and try again."
                end
            end
        end
        return false, ""
    end 

end

class TransactionController < ApplicationController
    def index
        @carts = Cart.where(["name = ?", current_user.email])
        @total = 0
        @taxes = 0
        tid = Order.all.size + 1
        @oc, @cc, @wc = calculate_counts()
        @carts.each do |unit|
            unitPrice = Item.where(["id = ?", unit.cartItem]).last.price
            tax = Item.where(["id = ?", unit.cartItem]).last.tax_slab
            quantity = unit.itemquantity
            @total += (unitPrice * quantity).round(2)
            @taxes += (unitPrice * tax * 0.01 * quantity).round(2)
        end
        @discounts, @message = discounts(@total, current_user.id)
        @orderTotal = (@total + @taxes - @discounts).round(2)

        if params[:is_true]
            units = Cart.where(["name = ?", current_user.email])
            is_special_item_stored = false
            is_adding_illegal_item = false
            failure_message = ""
            status = true
            units.each do |unit|
                unit_detail = Item.where(["id = ?", unit.cartItem]).last
                is_adding_illegal_item, failure_message = check_restricted_item(unit_detail, current_user.id)
                if is_adding_illegal_item
                    break
                end
            end
            if !is_adding_illegal_item
                units.each do |unit|
                    item = Item.where(["id = ?", unit.cartItem]).last
                    if item.special_item
                        is_special_item_stored = add_to_special_requests(current_user.id, item, tid)
                    end
                    #Create new record in order table
                    order = Order.new(:userId => current_user.id, :orderItemId => item.id, :transactionId => tid, :quantity => unit.itemquantity, :unitPrice => item.price, :orderPrice => @orderTotal)
                    #Update existing record in item table to reflect remaining quantity with decrement of quantity ordered by user
                    Item.where(:id => item.id).update(:remaining_quantity => item.remaining_quantity - unit.itemquantity)       
                    if !order.save                
                        status = false
                    end
                end
            end
            respond_to do |format|                
                if is_adding_illegal_item
                    format.html{redirect_to carts_url, notice: failure_message} 
                elsif status == true    
                    #Send mail to the user giving the purchase details
                    SubscriptionMailer.with(user_id: current_user.id, transaction_id: tid, total: @total, taxes: @taxes, discounts: @discounts, message: @message, orderTotal:@orderTotal).order_generated_email.deliver_now!
                    Cart.where(:name => current_user.email).destroy_all  
                    if is_special_item_stored
                        format.html{redirect_to items_url, notice: 'Order was successfully created which includes a special item.'}
                    else
                        format.html{redirect_to items_url, notice: 'Order was successfully created.'}
                    end
                else 
                    format.html{redirect_to items_url, notice: 'Sorry, the order could not be placed.'}
                end
            end
        end
    end    
end

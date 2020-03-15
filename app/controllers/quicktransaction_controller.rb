require 'date'
class QuicktransactionController < ApplicationController
    def index
        @item = Item.find(params[:itm_id])
        @total = @item.price.round(2)
        @taxes = (@item.price * @item.tax_slab * 0.01).round(2)
        @tid = Order.all.size + 1
        @discounts, @message = discounts(@total, current_user.id)
        @orderTotal = (@total + @taxes - @discounts).round(2)
        @oc, @cc, @wc = calculate_counts()
        if params[:otp_is_true]
            @order = Order.new(:userId => current_user.id, :orderItemId => @item.id, :transactionId => @tid, :quantity => 1, :unitPrice =>@item.price, :orderPrice=> @orderTotal)
            Item.where(:id => @item.id).update(:remaining_quantity => @item.remaining_quantity - 1)
            is_adding_illegal_item, failure_message = check_restricted_item(@item, current_user.id)
            if @item.special_item
                is_special_item_stored = add_to_special_requests(current_user.id, @item, @tid)
            end
            respond_to do |format|
                if is_adding_illegal_item
                    format.html{redirect_to items_url, notice: 'The purchase of the item is restricted.'} 
                elsif @order.save
                    SubscriptionMailer.with(user_id: current_user.id, transaction_id: @tid, total: @total, taxes: @taxes, discounts: @discounts, message: @message, orderTotal:@orderTotal).quick_order_generated_email.deliver_now!
                    if is_special_item_stored
                        format.html { redirect_to items_url, notice: 'Order of a special item was successfully created.' }
                    else
                        format.html { redirect_to items_url, notice: 'Order was successfully created.' }
                    end
                else
                    format.html { render :new }
                    format.json { render json: @order.errors, status: :unprocessable_entity }
                end
            end
        end
    end
end

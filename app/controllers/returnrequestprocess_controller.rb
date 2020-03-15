class ReturnrequestprocessController < ApplicationController
    def index
        if params[:is_approved] == "yes"
            respond_to do |format|
                if ReturnItem.where(["returnItemid = ?", params[:item_id]]).where(["returnuserId = ?", params[:user_id]]).where(["returnTransactionId = ?", params[:tid]]).update_all(:returnStatus => 1)
                    #Get the unique order from the order table with transaction ID and item ID for user ID and destroy it
                    destroyOrderItem = Order.where(:userId => params[:user_id]).where(:orderItemId => params[:item_id]).where(:transactionId => params[:tid])
                    #Update items remaining quantity and destroy the order
                    number = Item.where(:id => params[:item_id]).last.remaining_quantity
                    Item.where(:id => params[:item_id]).update(:remaining_quantity => number + destroyOrderItem.last.quantity)
                    destroyOrderItem.destroy_all
                    #Send notification to User saying return as successful
                    SubscriptionMailer.with(user_id: params[:user_id],item_id: params[:item_id], transaction_id: params[:tid], approved: true).return_item_email.deliver_now!
                    format.html { redirect_to orders_url, notice: 'Request has been Approved.' }
                else
                    format.html { redirect_to orders_url, notice: 'Error occured performing operation.' }
                end
            end
        elsif params[:is_approved] == "no"
            ReturnItem.where(["returnItemid = ?", params[:item_id]]).where(["returnuserId = ?", params[:user_id]]).where(["returnTransactionId = ?", params[:tid]]).destroy_all
            SubscriptionMailer.with(user_id: params[:user_id],item_id: params[:item_id], approved: false).return_item_email.deliver_now!
            respond_to do |format|
                format.html { redirect_to orders_url, notice: 'The Request has been rejected.' }
                format.json { head :no_content }
            end
        end
    end
end

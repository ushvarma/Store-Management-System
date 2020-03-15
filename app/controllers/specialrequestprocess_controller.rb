class SpecialrequestprocessController < ApplicationController
    def index
        if params[:is_approved] == "yes"
            respond_to do |format|
                if SpecialItem.where(["specialItemid = ?", params[:item_id]]).where(["specialuserId = ?", params[:user_id]]).where(["specialItemTransactionId = ?", params[:tid]]).update_all(:specialItemStatus => 1)
                    format.html { redirect_to orders_url, notice: 'Request has been Approved.' }
                else
                    format.html { redirect_to orders_url, notice: 'Error occured performing operation.' }
                end
            end
        elsif params[:is_approved] == "no"
            respond_to do |format|
                if SpecialItem.where(["specialItemid = ?", params[:item_id]]).where(["specialuserId = ?", params[:user_id]]).where(["specialItemTransactionId = ?", params[:tid]]).update_all(:specialItemStatus => 2)
                    format.html { redirect_to orders_url, notice: 'The Request has been rejected.' }
                else
                    format.html { redirect_to orders_url, notice: 'Error occured performing operation.' }
                end
            end
        end
    end
end

class ReturnItemsController < InheritedResources::Base
  
  def index
    @oc, @cc, @wc = calculate_counts()
    if params[:status_id]
      if current_user.is_admin
        @return_items = ReturnItem.where(["returnStatus = ?", params[:status_id]])
      else
        @return_items = ReturnItem.where(["returnuserId = ?", current_user.id]).where(["returnStatus = ?", params[:status_id]])
      end
    end
    
  end

  private
    def return_item_params
      params.permit(:returnuserId, :returnItemid, :returnTransactionId, :returnQuantity, :refundAmount)
    end

end

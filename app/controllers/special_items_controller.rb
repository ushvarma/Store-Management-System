class SpecialItemsController < InheritedResources::Base

  def index
    @oc, @cc, @wc = calculate_counts()
    if params[:status_id]
      if current_user.is_admin
        @special_items = SpecialItem.where(["specialItemStatus = ?", params[:status_id]])
      else
        @special_items = SpecialItem.where(["specialUserId = ?", current_user.id]).where(["specialItemStatus = ?", params[:status_id]])
      end
    end
  end
  private

    def special_item_params
      params.permit(:specialUserId, :specialItemid, :specialItemTransactionId, :specialQuantity, :refundAmount, :specialItemStatus)
    end

end

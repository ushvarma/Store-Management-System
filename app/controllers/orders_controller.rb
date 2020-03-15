class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @userorder = Order.where(:userId => current_user.id).select(:transactionId).map(&:transactionId).uniq
    @returnitemqueue = ReturnItem.where(:returnuserId => current_user.id)
    @oc, @cc, @wc = calculate_counts()
    @special_status = ["Admin Approval Pending","Approved","Rejected"]
    if params[:item_id]
      item_id = Item.find(params[:item_id]).id
      orderitem = Order.where(:orderItemId => item_id).where(:userId => current_user.id).last
      refund = (orderitem.unitPrice * orderitem.quantity).round(2)
      returnitem =  ReturnItem.new(:returnuserId => current_user.id, :returnItemid =>item_id , :returnTransactionId =>orderitem.transactionId , :returnQuantity =>orderitem.quantity , :refundAmount =>refund, :returnStatus => 0)
      
      respond_to do |format|                
        if returnitem.save  
          format.html{redirect_to orders_url, notice: 'Return was successfully placed.'}
        else 
          format.html{redirect_to orders_url, notice: 'Sorry, request for return could mot be processed. Try Again'}
        end
      end
    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    item = Item.where(:id => params[:orderItemId]).last
    is_adding_illegal_item, failure_message = check_restricted_item(item, current_user.id)
    if item.special_item
      is_special_item_stored = add_to_special_requests(current_user.id, item, params[:transactionId])
    end
    respond_to do |format|
      if is_adding_illegal_item
        format.html{redirect_to items_url, notice: 'The purchase of the item is restricted.'} 
      elsif @order.save
        if is_special_item_stored
          format.html { redirect_to @order, notice: 'Order of a special item was successfully created.' }
        else
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
        end
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:userId, :orderItemId, :transactionId, :quantity, :unitPrice, :orderPrice)
    end
end

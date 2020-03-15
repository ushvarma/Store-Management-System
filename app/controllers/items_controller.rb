class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_action :initialize_search, only: :index
  
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @items = Item.order(sort_column + " " + sort_direction)
    if current_user
      #@oc, @cc, @wc = calculate_counts()
      if current_user.is_admin
        @isAdmin = true
      else
        @isUser = true
      end
    else
      @visitor = true
    end
    handle_filters
    initialize_search
    if params[:is_subscribing]
      SubscriptionMailer.with(user_id: current_user.id, item_id: params[:item_id]).subscription_email.deliver_now!
      respond_to do |format|
        format.html { redirect_to items_url, notice: 'Item was successfully subscribed and mail has been sent.' }
      end
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    #@username = User.find(params[:uid]).name
    @oc, @cc, @wc = calculate_counts()
  end

  # GET /items/new
  def new
    @oc, @cc, @wc = calculate_counts()
    params[:remaining_quantity] = params[:quantity]
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @oc, @cc, @wc = calculate_counts()
  end

  # POST /items
  # POST /items.json
  def create
    @oc, @cc, @wc = calculate_counts()
    params[:item][:remaining_quantity] = params[:item][:quantity]
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :category, :quantity, :description, :remaining_quantity, :price, :tax_slab, :special_item, :age_restricted, :brand, :photo, :is_subscribing)
    end

    def sort_column
      Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Only allow a list of trusted parameters through.

    def initialize_search
      
      session[:filter] = params[:filter]
      params[:filter_option] = nil if params[:filter_option] == ""
      session[:filter_option] = params[:filter_option]
    end

    def handle_filters
      if session[:filter]== "category"
        
        if session[:filter_option]== session[:filter_option] && session[:filter_option] != nil && session[:filter_option] != "All"
          @items = @items.where(category: session[:filter_option])
          
        elsif session[:filter_option]== "All" 
          @items=@items
        end
      elsif session[:filter]=="brand"
        if session[:filter_option]== session[:filter_option] && session[:filter_option] != nil && session[:filter_option] != "All"
          @items = @items.where(brand: session[:filter_option])
        elsif session[:filter_option]== "All" 
          @items=@items
        end
      elsif session[:filter]=="remaining_quantity"
        
        if session[:filter_option]== "only_available"
          @items = @items
          
        end
      end
    end

end

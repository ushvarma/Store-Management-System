class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where("name = ?", current_user.email)
    dob = User.where(:id => current_user.id).last.date_of_birth
    @age = calculate_age(dob)
    @oc, @cc, @wc = calculate_counts()
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    is_updating = false
    unit = Cart.where(:item_id => params[:item_id]).where(:name => params[:name]).last
    if unit.present? 
      params[:itemquantity] = (params[:itemquantity].to_i + unit.itemquantity).to_s
      unit.update(cart_params)
      is_updating = true
    else
      @cart = Cart.new(cart_params)
    end
    respond_to do |format|
      if is_updating
        format.html { redirect_to items_url, notice: 'Cart was successfully updated.' }
      else
        if @cart.save
          format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.permit(:name, :cartItem, :user_id, :itemquantity, :item_id)
    end
end

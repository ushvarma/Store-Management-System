class AdminpagesController < ApplicationController
  before_action :set_adminpage, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /adminpages
  # GET /adminpages.json
  def index
    @adminpages = Adminpage.all
  end

  # GET /adminpages/1
  # GET /adminpages/1.json
  def show
  end

  # GET /adminpages/new
  def new
    @adminpage = Adminpage.new
  end

  # GET /adminpages/1/edit
  def edit
  end

  # POST /adminpages
  # POST /adminpages.json
  def create
    @adminpage = Adminpage.new(adminpage_params)

    respond_to do |format|
      if @adminpage.save
        format.html { redirect_to @adminpage, notice: 'Adminpage was successfully created.' }
        format.json { render :show, status: :created, location: @adminpage }
      else
        format.html { render :new }
        format.json { render json: @adminpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminpages/1
  # PATCH/PUT /adminpages/1.json
  def update
    respond_to do |format|
      if @adminpage.update(adminpage_params)
        format.html { redirect_to @adminpage, notice: 'Adminpage was successfully updated.' }
        format.json { render :show, status: :ok, location: @adminpage }
      else
        format.html { render :edit }
        format.json { render json: @adminpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminpages/1
  # DELETE /adminpages/1.json
  def destroy
    @adminpage.destroy
    respond_to do |format|
      format.html { redirect_to adminpages_url, notice: 'Adminpage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminpage
      @adminpage = Adminpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adminpage_params
      params.require(:adminpage).permit(:name, :email, :password, :phone_number, :date_of_birth, :address, :credit_card_number, :name_on_card, :expiration_date, :CVV)
    end
end

class UsersController < ApplicationController
  
  def index
  	@user = User.all
  end

  def new
    @user= user.new
  end

  def create
    @user = user.new(params[:user])
    if @user.save
        redirect_to users_path, notice: 'User created.'
    else
      render :action => :new
    end
  end
  
 def show
  @user = User.find(params[:id])
 end
  
 def destroy
     @user = User.find(params[:id])
     @user.destroy
     redirect_to users_path, notice: 'User deleted.'
 end

  def edit
     @user = User.find(params[:id])
  end


   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to users_path, notice: 'User deleted.'
     else
       render 'edit'
     end
   end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone_number , :date_of_birth, :address, :credit_card_number, :name_on_card , :expiration_date,:CVV)
  end


end

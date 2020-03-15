class SubscriptionMailer < ApplicationMailer
    default from: 'obscurebrook35176@gmail.com'
    def subscription_email
        @user = User.where("id = ?", params[:user_id]).last
        @item = Item.where("id = ?", params[:item_id]).last
        @url  = 'https://obscure-brook-35176.herokuapp.com/'
        mail(to: @user.email, subject:"Subscription-alert", message: "Subscribed")
    end

    def order_generated_email
        @user = User.where("id = ?", params[:user_id]).last
        @orders = Cart.where(["id = ?", params[:user_id]])
        @tid = params[:transaction_id]
        @total = params[:total]
        @taxes = params[:taxes]
        @message = params[:message]
        @discounts = params[:discounts]
        @orderTotal = params[:orderTotal]
        mail(to: @user.email, subject:"Your RailStore order ##{@tid}")
    end

    def otp_email
        @user = User.where("id = ?", params[:user_id]).last
        @otp = params[:otp_number] 
        @url  = 'https://obscure-brook-35176.herokuapp.com/'
        mail(to: @user.email, subject:"Your OTP", message: "OTP")
    end

    def quick_order_generated_email
        @user = User.where("id = ?", params[:user_id]).last
        @tid = params[:transaction_id]
        @total = params[:total]
        @taxes = params[:taxes]
        @message = params[:message]
        @discounts = params[:discounts]
        @orderTotal = params[:orderTotal]
        mail(to: @user.email, subject:"Your RailStore order ##{@tid}")
    end

    def return_item_email
        @user = User.where("id = ?", params[:user_id]).last
        @item = Item.where("id = ?", params[:item_id]).last
        @approved = "Rejected"
        if params[:approved]
            @total = @item.price.to_f + (@item.price.to_f * @item.tax_slab.to_f * 0.01)
            @approved = "Accepted"
        end            
        mail(to: @user.email, subject:"Your RailStore order ##{@tid}")
    end

end

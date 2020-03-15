class OtpController < ApplicationController
    def index
        @user = current_user.id
        #otp generation for verification
        ROTP::Base32.random_base32
        totp = ROTP::TOTP.new("base32secret3232")
        
        if params[:is_quick]
            session[:is_quick] = true
            session[:item_id] = params[:item_id]
        elsif params[:is_order]
            session[:is_order] = true
        end
        if params[:is_true]
            pass = totp.now
            session[:otp] = pass
            SubscriptionMailer.with(user_id: current_user.id, otp_number: pass).otp_email.deliver_now!
            respond_to do |format| 
                format.html{redirect_to otp_url, notice: "An otp has been sent to #{current_user.email} ."}
            end
        end

    end

    def getNum
        getotp = session[:otp]
        is_quick = session[:is_quick]
        session[:is_quick] = nil
        is_order = session[:is_order]
        session[:is_order] = nil
        respond_to do |format| 
            if getotp != params[:data]
                format.html{redirect_to transaction_url, alert: "Otp entered is incorrect. Please Retry payment."}
            else
                if is_quick
                    format.html{redirect_to quicktransaction_url(otp_is_true: true, itm_id: session[:item_id]), action: 'index'}
                elsif is_order
                    format.html{redirect_to transaction_url(is_true: true), action: 'index' }
                end
            end
        end
    end
end

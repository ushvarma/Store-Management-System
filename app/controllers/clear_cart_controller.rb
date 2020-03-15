class ClearCartController < ApplicationController
    def index
        Cart.where("name = ?", current_user.email).destroy_all
        redirect_to carts_url
    end
end

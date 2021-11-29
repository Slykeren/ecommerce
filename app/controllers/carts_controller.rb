class CartsController < ApplicationController
    def show
      cart_items = []

      session[:cart].each do |item|
        cart_items << item['id']
      end

      @cart = Book.find(cart_items)
    end

    def add_quantity
      session[:cart].each do |item|
        if item['id'] == params[:id].to_i
          item['quantity'] += 1
        end
      end
      redirect_back(fallback_location: root_path)
    end
end

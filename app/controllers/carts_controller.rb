class CartsController < ApplicationController
     

    def show
      
      cart_items = []
      session[:cart].each do |item|
        cart_items << item['id']
      end

      @cart = Book.find(cart_items)
    end

    def invoice
      cart_items = []
      session[:cart].each do |item|
        cart_items << item['id']
      end
      @cart = Book.find(cart_items)

      @order = Order.new
      @order.customer_id = session[:user_id]

      @subtotal = 0
      @cart.each_with_index do |item, index|
        @subtotal += item.price * session[:cart][index]['quantity']
      end
      user_province = User.find(session[:user_id]).province
      user_tax = Tax.find_by(province: user_province).amount
      @tax = @subtotal * user_tax
      @total = @subtotal + @tax
      @order.subtotal = @subtotal
      @order.tax = @tax
      @order.total = @total
      @order.save
    end


    def add_quantity
      session[:cart].each do |item|
        if item['id'] == params[:id].to_i
          item['quantity'] += 1
        end
      end
      redirect_back(fallback_location: root_path)
    end

    def remove_quantity
      session[:cart].each do |item|
        if item['id'] == params[:id].to_i
          item['quantity'] -= 1
        end
      end
      redirect_back(fallback_location: root_path)
    end

end

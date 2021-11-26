class OrdersController < ApplicationController
  def show
    
  end

  def create
    @order = Order.new(che)
    @order.user = current_user
    @order.save
    redirect_to checkout_path
  end

end

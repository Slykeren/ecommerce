class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.tax = 0.02 * @order.subtotal
    @order.total = @order.subtotal + @order.tax
    @order.save
  end

  def create
    
    @order = Order.find(session[:order_id])
    @order.customer_id = session[:user_id]
    @order.tax = 0.0
    @order.subtotal = session[:checkout]
    @order.total = 0.0
    @order.save
    redirect_to @order
    byebug
  end

end

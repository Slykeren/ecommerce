class BooksController < ApplicationController
  include ActionView::Helpers::NumberHelper

  add_breadcrumb "Home", :root_path

  def index
      @books = Book.all

      @order_item = current_order.order_items.new
  end

  def show
      
  end
end

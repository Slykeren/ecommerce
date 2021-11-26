class BooksController < ApplicationController
  include ActionView::Helpers::NumberHelper

  add_breadcrumb "Home", :root_path

  def index
      @books = Book.all

      @order_item = current_order.order_items.new
  end

  def show
    @book = Book.find(params[:id])
    add_breadcrumb @book.name, book_path(@book)
  end
end

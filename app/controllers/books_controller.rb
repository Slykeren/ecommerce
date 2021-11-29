class BooksController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :initialize_session
  before_action :load_cart

  add_breadcrumb "Home", :root_path

  def index
      @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    add_breadcrumb @book.name, book_path(@book)
  end

  def add_to_cart
    cart_items = {id: params[:id].to_i, quantity: 1}
    session[:cart] << cart_items unless session[:cart].include?(cart_items[:id])
    redirect_to root_path
  end

  def remove_from_cart
    session[:cart].delete_if { |item| item['id'] == params[:id].to_i }
    redirect_back(fallback_location: root_path)
  end

  private

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    cart_items = []
    session[:cart].each do |item|
      cart_items << item['id']
    end

    @cart = Book.find(cart_items)
  end










end

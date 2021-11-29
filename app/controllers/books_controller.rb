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
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    session[:cart].delete(params[:id].to_i)
    redirect_back(fallback_location: root_path)
  end

  private

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = Book.find(session[:cart])
  end










end

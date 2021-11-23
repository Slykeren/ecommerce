class BooksController < ApplicationController
  include ActionView::Helpers::NumberHelper

  add_breadcrumb "Home", :root_path

  def index
      @books = Book.all
  end

  def show
      
  end
end

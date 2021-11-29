class CartsController < ApplicationController
    def show
        @cart = Book.find(session[:cart])
    end
end

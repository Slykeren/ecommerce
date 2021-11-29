class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
     @user = User.new
  end
  def create
     @user = User.create(params.require(:user).permit(:email, :password, :password_confirmation, :province, :name, :city, :postal_code, :address, :country))
     session[:user_id] = @user.id
     redirect_to '/welcome'
  end
  end

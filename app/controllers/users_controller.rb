class UsersController < ApplicationController
  def index
  end

  def show
     @user = User.find(params[:id])
     @books = Book.all
     @book = Book.new
  end

  def update
  end

  def edit
  end

end

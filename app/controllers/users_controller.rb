class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
     @user = User.find(params[:id])
  end

  def update
  end

  def edit
  end

end

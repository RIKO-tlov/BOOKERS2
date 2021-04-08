class BooksController < ApplicationController
  def index
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
    @book = Book.find_by(id: params[:id])
    @books = @user.books
    @book = Book.new
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
      flash[:notice] = "Book was successfully destroyed."
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

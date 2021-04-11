class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
     @users = User.all
     @user = current_user
     @book = Book.new(user_id: @current_user.id)
  end

  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
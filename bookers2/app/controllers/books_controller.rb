class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @users = User.all
    @books = Book.all
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

class BooksController < ApplicationController

  def create
    book = Book.new(book_params)
    book.user = current_user
    book.save
    redirect_to "/books/"
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(@user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

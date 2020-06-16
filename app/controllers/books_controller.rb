class BooksController < ApplicationController
  def index
    @books = Book.all
    # form_for用
    @book = Book.new
  end
  
  def show

  end
  
  def new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

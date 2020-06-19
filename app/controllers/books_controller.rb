class BooksController < ApplicationController
  def index
    @books = Book.all
    # new用
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
  end

  # 空欄でなければ、そのまま登録して、空欄の場合には、error_messageを表示する
  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

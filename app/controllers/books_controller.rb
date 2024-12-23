class BooksController < ApplicationController
  def index
    @books = collection
  end

  def show
    @book = resourse
  end

  def new
    @book = Book.new
  end

  def edit
    @book = resourse
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = resourse

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resourse.destroy

    redirect_to books_path, notice: "Book was successfully destroyed.", status: :see_other
  end

  def search
    query = search_params[:query]

    if query.present?
      @books = BookSearch.search(query)

      if @books.any?
        flash.now[:notice] = "We found #{@books.count} books"
      else
        flash.now[:alert] = "No books match your search."
      end

      render :index
    else
      redirect_back(fallback_location: root_path, alert: "Search field cannot be empty.")
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :book_cover, :book_content, :description)
  end

  def search_params
    params.require(:search).permit(:query)
  end

  def collection
    Book.ordered
  end

  def resourse
    collection.find(params[:id])
  end
end

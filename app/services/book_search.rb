class BookSearch
  def self.search(query)
    search_results = BooksIndex
                      .query(query_string: {fields: [:title, :author], query: query})
                      .order(_score: :desc)
                      .to_a

    book_ids = search_results.map(&:id)
    books = Book.where(id: book_ids)
    books.sort_by { |book| book_ids.index(book.id) }
  end
end

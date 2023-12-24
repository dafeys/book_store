class BookSearch
  def self.search(query)
    BooksIndex
        .query(query_string: {fields: [:title, :author], query: query})
        .order(_score: :desc)
        .limit(50)
        .records
  end
end

class BookSearch
  def self.search(query)
    search_results = BooksIndex
                      .query(query_string: {fields: [:title, :author], query: query})
                      .order(_score: :desc)
                      .limit(50)
                      .records
  end
end

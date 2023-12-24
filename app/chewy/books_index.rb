class BooksIndex < Chewy::Index
  index_name { "books_#{Rails.env}" }
  index_scope Book.select(:id, :title, :author)
  field :title, analyzer: "standard"
  field :author, analyzer: "standard"
end

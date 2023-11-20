class BooksIndex < Chewy::Index
  index_scope Book
  field :title
  field :author
end

module ApplicationHelper
  def display_book_cover(book)
    image = book.book_cover.attached? ? book.book_cover : "book_cover.jpg"
    image_tag image, class: "book-img"
  end
end

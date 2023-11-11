module ApplicationHelper
  def display_book_cover(book)
    if book.book_cover.attached?
      image_tag book.book_cover, class: "book-img"
    else
      image_tag "book_cover.jpg", class: "book-img"
    end
  end
end

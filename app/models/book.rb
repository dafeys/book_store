class Book < ApplicationRecord
  has_one_attached :book_cover
  has_one_attached :book_content

  validates :title, :author, presence: true, length: { in: 1..50 }
  validates :isbn, presence: true, length: { is: 13 }
  validates :description, length: { maximum: 1000 }

  scope :ordered, -> { order(:title) }
  update_index("books") { self }
end

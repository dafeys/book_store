class Book < ApplicationRecord
  validates :title, :author, presence: true, length: { in: 1..50 }
  validates :isbn, presence: true, length: { is: 13 }
  validates :description, length: { in: 10..1000 }
end

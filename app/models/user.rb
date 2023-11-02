class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :username, :first_name, :last_name, :email, presence: true
  validates :email, :username, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 15 },
                       format: { with: /\A[a-z0-9_]+\z/,
                       message: "only allows lowercase letters, numbers, and underscores" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Name.name }
    isbn { Faker::Number.decimal_part(digits: 13) }
    description { Faker::Lorem.paragraph }
  end
end

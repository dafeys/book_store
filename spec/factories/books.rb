FactoryBot.define do
  factory :book, class: Book do
    title { Faker::Book.title }
    author { Faker::Name.name }
    isbn { Faker::Number.decimal_part(digits: 13) }
    description { Faker::Lorem.paragraph_by_chars(number: rand(200..500), supplemental: true) }

    trait :without_title do
      title { "" }
    end

    trait :long_title do
      title { Faker::Lorem.characters(number: 51) }
    end
  end
end

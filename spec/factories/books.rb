FactoryBot.define do
  factory :book do
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

    trait :with_cover do
      after(:build) do |book|
        book.book_cover.attach(io: File.open(Rails.root.join("spec", "fixtures", "test_cover.jpg")), filename: "test_cover.jpg", content_type: "image/jpg")
      end
    end

    trait :with_pdf do
      after(:build) do |book|
        book.book_content.attach(io: File.open(Rails.root.join("spec", "fixtures", "dummy.pdf")), filename: "dummy.pdf", content_type: "application/pdf")
      end
    end
  end
end

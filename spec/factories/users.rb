FactoryBot.define do
  factory :user, class: User do
    username { Faker::Internet.username(specifier: 3..20, separators: "").downcase }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :without_username do
      username { "" }
    end

    trait :wrong_email do
      email { Faker::Lorem.characters(number: 10) }
    end

    trait :short_password do
      encrypted_password { Faker::Lorem.characters(number: 5) }
    end
  end
end

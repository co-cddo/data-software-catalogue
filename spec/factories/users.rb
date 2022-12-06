FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end

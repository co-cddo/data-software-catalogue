FactoryBot.define do
  factory :organisation do
    name { Faker::Company.name }
    tag { Faker::Lorem.characters(number: 10) }
  end
end

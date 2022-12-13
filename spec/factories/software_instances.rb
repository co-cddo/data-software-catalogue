FactoryBot.define do
  factory :software_instance do
    name { Faker::App.name }
    association :organisation
    organisation_group { Faker::Commerce.department }
    team { Faker::Team.name }
    owner { Faker::App.author }
    product { Faker::Commerce.product_name }
    provider { Faker::Commerce.vendor }
    provider_contact { Faker::Name.name }
    version { Faker::App.semantic_version }
    description { Faker::Lorem.paragraph }
    status { 'production' }
    internal { false }
    license { 'MIT' }
    quantity_purchased { 1 }
    quantity_used { 1 }
  end
end

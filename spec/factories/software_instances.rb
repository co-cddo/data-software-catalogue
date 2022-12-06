FactoryBot.define do
  factory :software_instance do
    name { "MyString" }
    organisation { nil }
    organisation_group { "MyString" }
    team { "MyString" }
    owner { "MyString" }
    product { "MyString" }
    provider { "MyString" }
    provider_contact { "MyString" }
    version { "MyString" }
    description { "MyText" }
    status { "MyString" }
    internal { false }
    license { "MyString" }
    quantity_purchased { 1 }
    quantity_used { 1 }
  end
end

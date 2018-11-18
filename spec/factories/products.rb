FactoryBot.define do
  factory :product do
    name { Faker::Appliance.equipment }
    description { Faker::Lorem.paragraph(2) }
    unit_price { 29.90 }
    quantity { 10 }
  end
end

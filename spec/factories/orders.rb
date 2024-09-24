FactoryBot.define do
  factory :order do
    association :product
    customer_name { Faker::Name.name }
    status { 'processing' }
    fedex_id { nil }

    trait :awaiting_pickup do
      status { 'awaiting_pickup' }
      fedex_id { Faker::Number.number(digits: 10) }
    end

    trait :in_transit do
      status { 'in_transit' }
      fedex_id { Faker::Number.number(digits: 10) }
    end

    trait :delivered do
      status { 'delivered' }
      fedex_id { Faker::Number.number(digits: 10) }
    end
  end
end

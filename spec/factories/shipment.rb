FactoryBot.define do
  factory :shipment do
    source_location { Faker::Address.full_address }
    target_location { Faker::Address.full_address }
    item { Faker::Commerce.product_name }
    status { Shipment.statuses.keys.sample }
    association :user, factory: :user
    association :delivery_partner, factory: :user
  end
end
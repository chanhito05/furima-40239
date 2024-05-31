FactoryBot.define do
  factory :item do
    name { "商品名" }
    description { "商品の説明" }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    shipping_area_id { 2 }
    shipping_time_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
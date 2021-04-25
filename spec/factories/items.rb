FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name { Faker::Lorem.sentence }
    info { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    # sell_price  { "#{Faker::Number.number(digits: 3)}0"}
    sell_price  { Faker::Number.number(digits: 4) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) }
    shipping_schedule_id { Faker::Number.between(from: 2, to: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    sales_status_id { Faker::Number.between(from: 2, to: 7) }
  end
end

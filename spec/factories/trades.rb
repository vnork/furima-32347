FactoryBot.define do
  factory :form do
    
    city {Gimei.city.kanji}
    address {Gimei.town.kanji}
    building {Faker::Beer.brand}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    postal_code {Faker::Number.number(digits: 7).to_s.insert(3, "-")}
    phone_number {Faker::Number.number(digits: 11)}

  end
end

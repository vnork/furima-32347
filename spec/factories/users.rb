FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    email                 {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 6,min_alpha: 1, min_numeric: 1)
    password              {password}
    password_confirmation {password}
    nick_name             {Faker::Name.name}
    first_name            {person.first.kanji}
    first_name_kana       {person.first.katakana}
    last_name             {person.last.kanji}
    last_name_kana        {person.last.katakana}
    birth_date            {Faker::Date.in_date_period}
  end
end
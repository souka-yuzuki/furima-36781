FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password                {Faker::Lorem.characters(number: 6,min_alpha: 1, min_numeric: 1)}
    password_confirmation   {password}
    first_name              {person.first.kanji}
    last_name               {person.last.kanji}
    first_name_reading      {person.first.katakana}
    last_name_reading       {person.last.katakana}
    birthday                {Faker::Date.backward}
  end
end
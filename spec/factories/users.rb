FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_mail}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    first_name              {Faker::Name.name}
    last_name               {Faker::Name.name}
    first_name_reading      {Faker::Name.}
    last_name_reading       {Faker::Name.}
    birthday                {Faker::Date.}
  end
end
FactoryBot.define do
  factory :item do
    title               {Faker::Lorem.characters}
    explanation         {Faker::Lorem.sentence}
    category_id         {1}
    status_id           {1}
    load_id             {1}
    prefecture_id       {1}
    shipping_days_id    {1}
    price               {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

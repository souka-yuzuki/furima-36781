FactoryBot.define do
  factory :item do
    title               {Faker::Lorem.sentece}
    explanation         {Faker::Lorem.sentece}
    category_id         {1}
    status_id           {1}
    load_id             {1}
    prefecture_id       {1}
    shipping_days_id    {1}
    price               {}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

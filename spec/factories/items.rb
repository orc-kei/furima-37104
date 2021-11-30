FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}

    association :user
    category_id     { '2' }
    condition_id    { '2' }
    delivery_fee_id { '2' }
    prefecture_id   { '2' }
    delivery_day_id { '2' }
    price           {Faker::Number.between(from: 300, to: 500)}
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

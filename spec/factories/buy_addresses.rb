FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09055554444'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end

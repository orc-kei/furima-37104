FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { '00000@gmail.com' }
    password              { 'aaaaa1' }
    password_confirmation { password }

    family_name           { 'あ' }
    first_name            { 'あ' }
    family_name_kana      { 'ア' }
    first_name_kana       { 'ア' }
    birthday              { '1930-01-30' }
  end
end

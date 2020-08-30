FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'hoge28828' } # Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    last_name             { 'あ井ウ' }
    first_name            { 'え尾カ' }
    last_name_kana        { 'アイウ' }
    first_name_kana       { 'エオカ' }
    birthday              { '1930-01-01' }
  end
end

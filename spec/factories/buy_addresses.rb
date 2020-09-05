FactoryBot.define do
  factory :buy_address do
    user_id     { '1' }
    item_id     { '1' }
    token       { '1' }
    postal_code { '123-4567' }
    area_id     { '1' }
    city        { 'あ' }
    address     { 'い' }
    tel         { '08012345678' }
  end
end

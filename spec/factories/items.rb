FactoryBot.define do
  factory :item do
    name        { 'j' }
    content     { 'j' }
    category_id { '1' }
    status_id   { '1' }
    fee_id      { '1' }
    area_id     { '1' }
    day_id      { '1' }
    price       { '1000' }
    association :user
  end
end

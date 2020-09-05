class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :buy

  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  #   validates :area_id, numericality: { other_than: 0 }
  #   validates :city
  #   validates :address
  #   validates :tel, length: { maximum: 11 }
  #   validates :buy_id
  # end
  
end

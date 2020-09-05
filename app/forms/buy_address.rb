class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :area_id, :city, :address, :building, :tel, :buy_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\^\d{11}\z/ }
  end

  def save
    @buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, tel: tel, buy_id: @buy.id)
  end
end

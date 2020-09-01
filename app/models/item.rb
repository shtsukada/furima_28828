class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 0 } 
    validates :status_id, numericality: { other_than: 0 } 
    validates :fee_id, numericality: { other_than: 0 } 
    validates :area_id, numericality: { other_than: 0 } 
    validates :day_id, numericality: { other_than: 0 } 
    validates :price, inclusion: { in: 300..9999999 }
    validates :user_id
  end

end

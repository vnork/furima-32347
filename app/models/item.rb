class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :shipping_schedule
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates  :image 
    validates  :item_name
    validates  :info
    validates  :sell_price, format: { with: /\A[0-9]+\z/, message: "Half-width number"}, inclusion: { in:300..9999999, message: "Out of setting range"}
    validates  :user
  end
  with_options numericality: { other_than: 1, message: 'Select'} do
    validates  :category_id
    validates  :sales_status_id
    validates  :shipping_fee_status_id
    validates  :prefecture_id
    validates  :shipping_schedule_id
  end
end

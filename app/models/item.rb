class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :shipping_schedule
  belongs_to :user

  with_options presence: true do
    validates  :item_name
    validates  :info
    validates  :category_id,            numericality: { other_than: 1 } 
    validates  :sales_status_id,        numericality: { other_than: 1 } 
    validates  :sell_price
    validates  :shipping_fee_status_id, numericality: { other_than: 1 } 
    validates  :shipping_schedule_id,   numericality: { other_than: 1 } 
    validates  :prefecture_id,          numericality: { other_than: 1 } 
    validates  :user
  end
end

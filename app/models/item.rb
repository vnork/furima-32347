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
    # validates  :sell_price , inclusion: { in: 300..9999990, message: "が範囲外です" },format: {with: /[0]\z/, message: "は10円単位で設定してください"}
    validates  :sell_price, inclusion: { in: 300..9_999_999, message: 'が範囲外です' }
    validates  :user
  end
  validates :sell_price_before_type_cast, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates  :category_id
    validates  :sales_status_id
    validates  :shipping_fee_status_id
    validates  :prefecture_id
    validates  :shipping_schedule_id
  end
end

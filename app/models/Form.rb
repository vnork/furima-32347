class Form
  include ActiveModel::Model
  attr_accessor :city, :address, :building, :prefecture_id, :postal_code, :phone_number, :trade_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は"-"を含んだ半角数字で入力してください' },
                            length: { maximum: 8, message: 'は"-"を含めた8桁以下で入力してください' }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字のみで入力してください' },
                             length: { maximum: 11, message: 'は11桁以下で入力してください' }
    validates :token
  end

  def save
    trade = Trade.create(user_id: user_id, item_id: item_id)
    Destination.create(city: city, address: address, building: building, prefecture_id: prefecture_id, postal_code: postal_code,
                       phone_number: phone_number, trade_id: trade.id)
  end
end

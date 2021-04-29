class Form
  include ActiveModel::Model
  attr_accessor :city, :address, :building, :prefecture_id, :postal_code, :phone_number, :trade_id, :user_id, :item_id
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :building
    validates :prefecture_id
    validates :postal_code
    validates :phone_number
  end
  
  def save
    trade = Trade.create!(user_id: user_id, item_id: item_id)
    Destination.create!(city: city, address: address, building: building, prefecture_id: prefecture_id, postal_code: postal_code,phone_number: phone_number, trade_id: trade.id )
  end

end
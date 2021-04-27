class Form
  include ActiveModel::Model
  attr_accessor :city, :address, :building, :prefecture_id, :postal_code, :phone_number, :trade, :user, :item

  with_options presence: true do
    validates :city
    validates :address
    validates :building
    validates :prefecture_id
    validates :postal_code
    validates :phone_number
    validates :trade
    validates :user
    validates :item
  end

  def save
    @trade = Trade.new(trade_params)
    @destination = Destination.new(destination_params)
    @trade.save
    @destination.save
  end

  privete

  def trade_params
    params.require(:trade).permit(:item_id).merge(user_id: current_user.id)
  end

  def destination_params
    params.require(:destination).permit(:city, :address, :building, :prefecture_id, :postal_code, :phone_number, :trade_id)
  end
end
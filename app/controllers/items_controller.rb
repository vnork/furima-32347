class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :info, :category_id, :sales_status_id, :sell_price,
                                 :shipping_fee_status_id, :shipping_schedule_id, :prefecture_id).merge(user_id: current_user.id)
  end
end

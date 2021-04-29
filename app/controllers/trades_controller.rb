class TradesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end

  def new
    @form = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def form_params
    params.permit(:city, :address, :building, :prefecture_id, :postal_code, :phone_number, :item_id, :user_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sell_price,
      card: form_params[:token],
      currency:'jpy'
    )
  end
end


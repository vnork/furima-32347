class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :check_correct_access

  def index
    @form = Form.new
  end

  def create
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
    params.require(:form).permit(:city, :address, :building, :prefecture_id, :postal_code, :phone_number, :user_id).merge(
     item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.sell_price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def check_correct_access
    unless request.referer&.include?(item_path(@item.id)) && @item.trade.blank? && current_user.id != @item.user.id
     redirect_to root_path 
    end
  end
end

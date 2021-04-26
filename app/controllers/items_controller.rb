class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
    if current_user.id == @item.user.id && request.referer&.include?(item_path(@item.id))
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id && request.referer&.include?(item_path(@item.id))
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :info, :category_id, :sales_status_id, :sell_price,
                                 :shipping_fee_status_id, :shipping_schedule_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end

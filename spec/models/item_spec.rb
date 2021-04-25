require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = build(:item)
  end

  describe '商品出品機能' do
    it 'image,name,info,category_id,condition_id,shipping_fee_id,prefecture_id,send_day_id,priceがあれば出品できる' do
      expect(@item).to be_valid
    end
    it 'priceが300円なら出品できる' do
      @item.sell_price = 300
      expect(@item).to be_valid
    end
    it 'priceが9,999,999円なら出品できる' do
    # 1円単位を使用不可にする場合は下記を使用 
    # it 'priceが9,999,990円なら出品できる' do
      # @item.sell_price = 9999990
      @item.sell_price = 9_999_999
      expect(@item).to be_valid
    end
    it 'imageがないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameがないと出品できない' do
      @item = build(:item, item_name: '')
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'infoがないと出品できない' do
      @item = build(:item, info: '')
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'category_idがないと出品できない' do
      @item = build(:item, category_id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Category を選択してください')
    end
    it 'sales_status_idがないと出品できない' do
      @item = build(:item, sales_status_id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status を選択してください')
    end
    it 'shipping_fee_status_idがないと出品できない' do
      @item = build(:item, shipping_fee_status_id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status を選択してください')
    end
    it 'prefecture_idがないと出品できない' do
      @item = build(:item, prefecture_id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture を選択してください')
    end
    it 'shipping_schedule_idがないと出品できない' do
      @item = build(:item, shipping_schedule_id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping schedule を選択してください')
    end
    it 'sell_priceがないと出品できない' do
      @item = build(:item, sell_price: '')
      @item.valid?
      expect(@item.errors.full_messages).to include("Sell price can't be blank")
    end
    it 'sell_priceが300円以下だと出品できない' do
      # 1円単位を使用不可にする場合は下記を使用
      # @item = build(:item, sell_price: 290)
      @item = build(:item, sell_price: 299)
      @item.valid?
      expect(@item.errors.full_messages).to include('Sell price が範囲外です')
    end
    it 'sell_priceが9,999,999円以上だと出品できない' do
      # 1円単位を使用不可にする場合は下記を使用 
      # it 'sell_priceが9,999,990円以上だと出品できない' do
      @item = build(:item, sell_price: 10_000_000)
      @item.valid?
      expect(@item.errors.full_messages).to include('Sell price が範囲外です')
    end
    it 'sell_priceが半角数字でないと出品できない' do
      @item = build(:item, sell_price: '３００')
      @item.valid?
      expect(@item.errors.full_messages).to include('Sell price before type cast は半角数字で入力してください')
    end
    it 'sell_priceが半角英数混合では登録できないこと' do
      @item = build(:item, sell_price: '300yen')
      @item.valid?
      expect(@item.errors.full_messages).to include('Sell price before type cast は半角数字で入力してください')
    end
    it 'sell_priceが半角英語だけでは登録できないこと' do
      @item.sell_price = 'ThreeHundredYen'
      @item.valid?
      expect(@item.errors.full_messages).to include('Sell price before type cast は半角数字で入力してください')
    end
    # 1円単位を使用不可にする場合は下記を使用
    # it 'sell_priceの1の位が0以外では登録できないこと' do
      # @item.sell_price = "301"
      # @item.valid?
      # expect(@item.errors.full_messages).to include('Sell price は10円単位で設定してください')
    # end
  end
end

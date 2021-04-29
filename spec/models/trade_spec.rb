require 'rails_helper'
require 'faker'

RSpec.describe Form, type: :model do
  before do
    @Form = build(:form)
  end

  describe '商品購入' do
    it '電話番号が空では登録できない' do
      @Form = build(:form, phone_number: '')
      @Form.valid?
      expect(@Form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンが入っていると登録できない' do
      @Form = build(:form, phone_number: Faker::Number.number(digits: 11).to_s.insert(3,"-"))
      @Form.valid?
      expect(@Form.errors.full_messages).to include("Phone number は半角数字のみで入力してください")
    end
    it '郵便番号が空では登録できない' do
      @Form = build(:form, postal_code: '')
      @Form.valid?
      expect(@Form.errors.full_messages).to include("Postal code can't be blank")

    end
    it '郵便番号が数字のみでは登録できない' do
      @Form = build(:form, postal_code: Faker::Number.number(digits: 7))
      @Form.valid?
      expect(@Form.errors.full_messages).to include("Postal code は\"-\"を含んで入力してください")
    end
    it '都道府県が空では登録できない' do
      @Form = build(:form, prefecture_id: 1)
      @Form.valid?
      expect(@Form.errors.full_messages).to include("Prefecture を選択してください")
    end
    it '市区町村が空では登録できない' do
      @Form = build(:form, city: '')
      @Form.valid?
      expect(@Form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では登録できない' do
      @Form = build(:form, address: '')
      @Form.valid?
      expect(@Form.errors.full_messages).to include("Address can't be blank")
    end

  end
end
require 'rails_helper'
require 'faker'

RSpec.describe Form, type: :model do
  before do
    @form = build(:form)
  end

  describe '商品購入' do
    it '電話番号が空では登録できない' do
      @form = build(:form, phone_number: '')
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンが入っていると登録できない' do
      @form = build(:form, phone_number: Faker::Number.number(digits: 11).to_s.insert(3, '-'))
      @form.valid?
      expect(@form.errors.full_messages).to include('Phone number は半角数字のみで入力してください')
    end
    it '電話番号が12桁以上では登録できない' do
      @form = build(:form, phone_number: Faker::Number.number(digits: 12))
      @form.valid?
      expect(@form.errors.full_messages).to include('Phone number は11桁以下で入力してください')
    end
    it '電話番号が半角数字以外では登録できない' do
      @form = build(:form, phone_number: Faker::Lorem.characters(number: 11))
      @form.valid?
      expect(@form.errors.full_messages).to include('Phone number は半角数字のみで入力してください')
    end
    it '郵便番号が空では登録できない' do
      @form = build(:form, postal_code: '')
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角数字のみでは登録できない' do
      @form = build(:form, postal_code: Faker::Number.number(digits: 7))
      @form.valid?
      expect(@form.errors.full_messages).to include('Postal code は"-"を含んだ半角数字で入力してください')
    end
    it '郵便番号が半角数字以外では登録できない' do
      @form = build(:form, postal_code: Faker::Lorem.characters(number: 7).to_s.insert(3, '-'))
      @form.valid?
      expect(@form.errors.full_messages).to include('Postal code は"-"を含んだ半角数字で入力してください')
    end
    it '郵便番号が9桁以上では登録できない' do
      @form = build(:form, postal_code: Faker::Number.number(digits: 8).to_s.insert(3, '-'))
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code は\"-\"を含めた8桁以下で入力してください")
    end
    it '都道府県が空では登録できない' do
      @form = build(:form, prefecture_id: 1)
      @form.valid?
      expect(@form.errors.full_messages).to include('Prefecture を選択してください')
    end
    it '市区町村が空では登録できない' do
      @form = build(:form, city: '')
      @form.valid?
      expect(@form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では登録できない' do
      @form = build(:form, address: '')
      @form.valid?
      expect(@form.errors.full_messages).to include("Address can't be blank")
    end
  end
end

require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user = build(:user, nick_name: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end

    it 'emailが空では登録できない' do
      @user = build(:user, email: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに＠が含まれていないと登録できない' do
      # Fakerを用いてランダムな半角英数字混合でテストしています
      @user = build(:user, email: Faker::Lorem.characters(number: 8, min_alpha: 1, min_numeric: 1))
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'emailが重複していると登録できない' do
      @user.save
      another_user = build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end

    it 'passwordが空では登録できない' do
      @user = build(:user, password: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが6文字以下だと登録できない' do
      @user = build(:user, password: Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1))
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'passwordが数字のみでは登録できない' do
      @user = build(:user, password: Faker::Number.number(digits: 6))
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
    end

    it 'passwordが英字のみでは登録できない' do
      @user = build(:user, password: Faker::Lorem.words(number: 6))
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
    end

    it 'passwordが存在する場合でもpassword_confirmationが空では登録できない' do
      @user = build(:user, password_confirmation: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user = build(:user, password_confirmation: Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1))
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_nameが空では登録できない' do
      @user = build(:user, last_name: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user = build(:user, last_name: Faker::Lorem.words)
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name Full-width characters'
    end

    it 'first_nameが空では登録できない' do
      @user = build(:user, first_name: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user = build(:user, first_name: Faker::Lorem.words)
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name Full-width characters'
    end

    it 'last_name_kanaが空では登録できない' do
      @user = build(:user, last_name_kana: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'last_name_kanaが全角（カタカナ）以外では登録できない' do
      @user = build(:user, last_name_kana: Gimei.last.kanji)
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana Full-width katakana characters'
    end

    it 'first_name_kanaが空では登録できない' do
      @user = build(:user, first_name_kana: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'first_name_kanaが全角（カタカナ）以外では登録できない' do
      @user = build(:user, first_name_kana: Gimei.first.kanji)
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana Full-width katakana characters'
    end

    it 'birth_dateが空では登録できない' do
      @user = build(:user, birth_date: '')
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end

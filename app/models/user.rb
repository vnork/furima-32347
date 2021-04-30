class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :trades

  validates :password,              length: { minimum: 6 },
                                    format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,}+\z/, message: 'は英字と数字の両方を含めて設定して下さい' }
  with_options presence: true do
    validates :nick_name
    validates :last_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力して下さい' }
    validates :first_name,          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力して下さい' }
    validates :last_name_kana,      format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力して下さい' }
    validates :first_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力して下さい' }
    validates :birth_date
  end
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,              length: { minimum: 6 },
                                    format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,}+\z/, message: 'Include both letters and numbers' }
  with_options presence: true do                                  
    validates :nick_name
    validates :last_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :first_name,          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :last_name_kana,      format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :first_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :birth_date
  end
end

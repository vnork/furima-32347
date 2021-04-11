class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,                 uniqueness: true
  validates :password,              length: { minimum: 6 },
                                    format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,}+\z/, message: 'Include both letters and numbers' }
  validates :nick_name,             presence: true
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
  validates :last_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :first_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  validates :birth_date,            presence: true
end

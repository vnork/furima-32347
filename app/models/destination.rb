class Destination < ApplicationRecord
  belongs_to :trade
  belongs_to :prefecture

  with_options presence: true do
    validates :city
    validates :address
    validates :building
    validates :prefecture_id
    validates :postal_code
    validates :phone_number
    validates :trade
  end
end

class Trade < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :destination

  with_options presence: true do
    validates :user_id
    validates :item_id
  end
end

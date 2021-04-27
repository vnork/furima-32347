class Trade < ApplicationRecord
  belongs_to :users
  belongs_to :items
  belongs_to :destinations

  with_options presence: true do
    validates :user
    validates :item
  end
end

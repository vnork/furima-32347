class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :trade
  belongs_to :prefecture

end

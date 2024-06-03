=begin
*商品購入機能
class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
=end

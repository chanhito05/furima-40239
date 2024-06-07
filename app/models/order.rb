class Order < ApplicationRecord
  # attr_accessor :token

  # with_options presence: true do
  #   validates :token, presence: true
  #   validates :postal_code, presence: true
  #   validates :postal_code, presence: true

  #   validates :prefecture_id, presence: true

  #   validates :token
  #   validates :price, numericality: { greater_than: 0 }
  #   validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む正しい形式で入力してください" }
  #   validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  #   validates :city, presence: true
  #   validates :address
  #   validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
  # end

  # belongs_to :user
  # belongs_to :item
end

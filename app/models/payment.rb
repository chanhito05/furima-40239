class Payment < ApplicationRecord
  # include ActiveModel::Model
  # attr_accessor :user_id, :item_id, :price, :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  # # バリデーションの処理を書く
  # with_options presence: true do
  #   validates :token
  #   validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む正しい形式で入力してください" }
  #   validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  #   validates :city
  #   validates :address
  #   validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
  # end

  # def save
  #   # 購入情報を保存
  #   purchase = Purchase.create(user_id: user_id, item_id: item_id, price: price)

  #   # 住所情報を保存
  #   Address.create(
  #     purchase_id: purchase.id,
  #     postal_code: postal_code,
  #     prefecture_id: prefecture_id,
  #     city: city,
  #     address: address,
  #     building: building,
  #     phone_number: phone_number
  #   )
  # end
end

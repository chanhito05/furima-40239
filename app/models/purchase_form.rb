class PurchaseForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :credit_card_number, :expiration_date, :cvv,
                :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :credit_card_number, length: { is: 16 }, numericality: { only_integer: true }
    validates :expiration_date
    validates :cvv, length: { is: 3 }, numericality: { only_integer: true }
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む正しい形式で入力してください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
  end

  def save
    if valid?
      # Purchaseレコードを作成
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
      # Addressレコードを作成
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    else
      false
    end
  end
end

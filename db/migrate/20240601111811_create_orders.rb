class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :phone_number, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.integer :price, null: false

      t.timestamps
    end
  end
end
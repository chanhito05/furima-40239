class AddPostalCodeToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :postal_code, :string
  end
end

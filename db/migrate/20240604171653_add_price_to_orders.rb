class AddPriceToOrders < ActiveRecord::Migration[7.0]
  
  def change
    add_column :orders, :price, :decimal
  end
end

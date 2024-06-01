class RemoveShippingAreaFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :shipping_area, :string
  end
end

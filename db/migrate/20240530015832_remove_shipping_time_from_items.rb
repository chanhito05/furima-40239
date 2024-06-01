class RemoveShippingTimeFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :shipping_time, :string
  end
end

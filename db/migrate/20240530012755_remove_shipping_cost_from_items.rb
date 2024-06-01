class RemoveShippingCostFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :shipping_cost, :string if column_exists?(:items, :shipping_cost)
  end
end

class RemoveConditionFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :condition, :string if column_exists?(:items, :condition)
  end
end

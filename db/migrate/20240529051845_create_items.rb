class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.string :condition, null: false
      t.string :shipping_cost, null: false
      t.string :shipping_area, null: false
      t.string :shipping_time, null: false
      t.integer :price, null: false



      t.timestamps
    end
  end
end

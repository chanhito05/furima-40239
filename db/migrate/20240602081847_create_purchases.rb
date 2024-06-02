class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
=begin
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
=end
      t.timestamps
    end
  end
end

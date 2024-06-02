class CreatePurchases < ActiveRecord::Migration[7.0]
  def change

      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

  end
end

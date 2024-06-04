class CreatePayments < ActiveRecord::Migration[7.0]
  class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :amount, null: false
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end

end

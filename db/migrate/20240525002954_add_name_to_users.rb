class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false unless column_exists?(:users, :name)
    add_column :users, :email, :string, null: false unless column_exists?(:users, :email)
    add_column :users, :encrypted_password, :string, null: false unless column_exists?(:users, :encrypted_password)
    add_column :users, :nickname, :string, null: false unless column_exists?(:users, :nickname)
    add_column :users, :last_name, :string, null: false unless column_exists?(:users, :last_name)
    add_column :users, :first_name, :string, null: false unless column_exists?(:users, :first_name)
    add_column :users, :last_name_kana, :string, null: false unless column_exists?(:users, :last_name_kana)
    add_column :users, :first_name_kana, :string, null: false unless column_exists?(:users, :first_name_kana)
    add_column :users, :birth_day, :string, null: false unless column_exists?(:users, :birth_day)
  end
end

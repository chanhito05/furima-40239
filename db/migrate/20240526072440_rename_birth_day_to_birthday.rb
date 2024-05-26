class RenameBirthDayToBirthday < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :birth_day, :string
  end
end

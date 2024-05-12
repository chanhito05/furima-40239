class CreateAtticles < ActiveRecord::Migration[7.0]
  def change
    create_table :atticles do |t|
      
      t.timestamps
    end
  end
end

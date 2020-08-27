class CreateResidencies < ActiveRecord::Migration[5.2]
  def change
    create_table :residencies do |t|
      t.integer :prefecture_id
      t.string :city
      t.integer :address
      t.string :building
      t.integer :zip_code
      t.integer :user_id

      t.timestamps
    end
  end
end

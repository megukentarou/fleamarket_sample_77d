class CreateResidencies < ActiveRecord::Migration[5.2]
  def change
    create_table :residencies do |t|
      t.integer :prefecture_id
      t.string :city                null: false
      t.integer :address            null: false
      t.string :building            null: false
      t.integer :zip_code           null: false
      t.integer :user_id            null: false,foreign_key: true
      t.timestamps
    end
  end
end

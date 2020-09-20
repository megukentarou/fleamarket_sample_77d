class CreateResidencies < ActiveRecord::Migration[5.2]
  def change
    create_table :residencies do |t|
      t.integer :prefecture_id
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_name_reading, null: false
      t.string :first_name_reading, null: false
      t.string :city,                null: false
      t.integer :address,            null: false
      t.integer :zip_code,           null: false
      t.string :building
      t.string :phone
      t.integer :user_id,            null: false,foreign_key: true
      t.timestamps
    end
  end
end

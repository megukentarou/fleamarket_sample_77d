class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,                null: false
      t.integer :price,               null: false
      t.string  :explanation,         null: false
      # activehashに変更した為最後に_id追記
      t.integer  :delivery_day_id,    null: false
      # activehashに変更した為最後に_id追記
      t.integer  :fee_id,             null: false
      t.integer  :user_id,            null: false, foreign_key: true
      t.integer  :category_id,        null: false, foreign_key: true
      t.integer  :brand_id    
      t.integer  :condition_id,       null: false, foreign_key: true
      # 都道府県情報は出品時に必要なのでは？
      t.integer  :prefecture_id,      null: false
      t.integer  :residency_id,       null: false
      t.timestamps
    end
  end
end
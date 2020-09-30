class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string   :name,               null: false
      t.integer  :price,              null: false
      t.string   :explanation,        null: false
      t.integer  :delivery_day_id,    null: false
      t.integer  :fee_id,             null: false
      t.string   :brand    
      t.integer  :condition_id,       null: false
      t.integer  :prefecture_id,      null: false
      t.integer  :category_id,        null: false, foreign_key: true
      t.integer  :user_id,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
class CreateConsignors < ActiveRecord::Migration[5.2]
  def change
    create_table :consignors do |t|
      t.string        :family_name	    null:false
      t.string        :family_kana      null:false
      t.string        :name             null:false
      t.string        :name_kana        null:false
      t.string        :phone         
      t.integer       :user_id          null: false, foreign_key: true
      t.integer       :residency_id     null: false, foreign_key: true
      t.timestamps
    end
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_one :soldout

  #以下はフリマのバリデーションコード
  with_options presence: true do
    validates :name,               length: {maximum: 40}
    validates :price,              length: {maximum: 7}
    validates :explanation,        length: {maximum: 1000}
    validates :delivery_day_id 
    validates :fee_id
    validates :condition_id 
    validates :prefecture_id
  end
end
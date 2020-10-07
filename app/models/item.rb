class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_one :soldout

  #以下はフリマのバリデーションコード
  with_options presence: true do
    validates :name,
      length: {maximum: 40}
    validates :price,
      numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999}
    validates :explanation,
      length: {maximum: 1000} 
    validates :delivery_day_id 
    validates :fee_id
    validates :condition_id 
    validates :prefecture_id
    validates :images
    validates :category_id
  end
end
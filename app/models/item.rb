class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_one :consignor
  belongs_to :condition
  belongs_to :prefecture
  has_one :soldout

  mount_uploader :image, ImageUploader
end

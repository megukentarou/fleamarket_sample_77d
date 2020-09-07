class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images
  has_one :consignor
  belongs_to :condition
  belongs_to :prefecture

  # mount_uploader :image, ImageUploader
end

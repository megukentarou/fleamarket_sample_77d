class Residency < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :prefecture
  belongs_to :user, optional: true
end

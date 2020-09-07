class Consignor < ApplicationRecord
  belongs_to :user
  belongs_to :residency  

  validates :family_name, presence: true
  validates :family_kana, presence: true
  validates :name, presence: true
  validates :name_kana, presence: true
end

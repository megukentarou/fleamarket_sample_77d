class Residency < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: true do
    validates :zip_code, format:{ with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :address
    validates :family_name
    validates :first_name
    validates :family_name_reading
    validates :first_name_reading
  end
end

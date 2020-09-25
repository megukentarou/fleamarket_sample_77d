class Residency < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: true do
    validates :zip_code, format:{ with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :address
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :first_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
validates :family_name_reading,  format: { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }
validates :first_name_reading,  format: { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }
  end
end

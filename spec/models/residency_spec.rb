require 'rails_helper'

describe Residency do
  describe '#create' do


    it "family_nameがない場合は登録できないこと" do
      user = build(:user)
      residency = build(:residency, user_id: user.id, family_name: nil)
      residency.valid?
      expect(residency.errors[:family_name]).to include("を入力してください", "を全角で入力してください")
    end

    it "family_name_readingがない場合は登録できないこと" do
      residency = build(:residency, family_name_reading: nil)
      residency.valid?
      expect(residency.errors[:family_name_reading]).to include("を入力してください", "を全角カタカナで入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      residency = build(:residency, first_name: nil)
      residency.valid?
      expect(residency.errors[:first_name]).to include("を入力してください", "を全角で入力してください")
    end

    it "first_name_readingがない場合は登録できないこと" do
      residency = build(:residency, first_name_reading: nil)
      residency.valid?
      expect(residency.errors[:first_name_reading]).to include("を入力してください", "を全角カタカナで入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      residency = build(:residency, prefecture_id: nil)
      residency.valid?
      expect(residency.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      residency = build(:residency, city: nil)
      residency.valid?
      expect(residency.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      residency = build(:residency, address: nil)
      residency.valid?
      expect(residency.errors[:address]).to include("を入力してください")
    end

  end
end
require 'rails_helper'

describe Residency do
  describe '#create' do


    it "family_nameがない場合は登録できないこと" do
      user = build(:user)
      residency = build(:residency, user_id: user.id, family_name: nil)
      residency.valid?
      expect(residency.errors[:family_name]).to include("can't be blank")
    end

    it "family_name_readingがない場合は登録できないこと" do
      residency = build(:residency, family_name_reading: nil)
      residency.valid?
      expect(residency.errors[:family_name_reading]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      residency = build(:residency, first_name: nil)
      residency.valid?
      expect(residency.errors[:first_name]).to include("can't be blank")
    end

    it "first_name_readingがない場合は登録できないこと" do
      residency = build(:residency, first_name_reading: nil)
      residency.valid?
      expect(residency.errors[:first_name_reading]).to include("can't be blank")
    end

    it "prefectureがない場合は登録できないこと" do
      residency = build(:residency, prefecture_id: nil)
      residency.valid?
      expect(residency.errors[:prefecture_id]).to include("can't be blank")
    end

    it "cityがない場合は登録できないこと" do
      residency = build(:residency, city: nil)
      residency.valid?
      expect(residency.errors[:city]).to include("can't be blank")
    end

    it "addressがない場合は登録できないこと" do
      residency = build(:residency, address: nil)
      residency.valid?
      expect(residency.errors[:address]).to include("can't be blank")
    end

  end
end
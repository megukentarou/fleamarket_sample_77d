require 'rails_helper'

describe Item do
  describe '#create' do

    it "商品名(name)の入力がないと登録できない事" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "価格(price)の入力がないと登録できない事" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "商品説明(explanation)の入力がないと登録できない事" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("を入力してください")
    end

    it "発送までの日数(delivery_day)の選択ないと登録できない" do
      item = build(:item, delivery_day: nil)
      item.valid?
      expect(item.errors[:delivery_day]).to include("を入力してください")
    end

    it "配送料の負担(fee)の選択ないと登録できない" do
      item = build(:item, fee: nil)
      item.valid?
      expect(item.errors[:fee]).to include("を入力してください")
    end

    it "発送元(prefecture_id)の選択ないと登録できない" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "カテゴリー(category_id)の選択ないと登録できない" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "商品の状態(condition_id)の選択ないと登録できない" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end



  end
end
class ItemsController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @conditions = Condition.all
    @prefectures = Prefecture.all
    @parent_category = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @parent_category << parent.name
    end
  end

  # 親カテゴリーが選択された後の子カテゴリーのアクション
  def get_children_category
    # 選択された親カテゴリーに紐づく子カテゴリーの配列を取得
    @children_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後の孫カテゴリーのアクション
  def get_grandchildren_category
    # 選択された子カテゴリーに紐づく孫カテゴリーの配列を取得
    @grandchildren_category = Category.find(params[:child_id]).children
  end

  def show
  end
end

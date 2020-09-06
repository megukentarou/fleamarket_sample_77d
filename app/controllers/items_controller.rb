class ItemsController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @conditions = Condition.all
    @prefectures = Prefecture.all
    @parent = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @parent << parent.name
    end
  end

  def show
  end
end

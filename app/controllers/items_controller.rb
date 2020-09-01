class ItemsController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @conditions = Condition.all
    @prefectures = Prefecture.all
  end
end

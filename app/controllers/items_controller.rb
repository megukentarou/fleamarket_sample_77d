class ItemsController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end
end

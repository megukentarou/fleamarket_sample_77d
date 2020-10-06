class UsersController < ApplicationController
  before_action :set_category

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def edit
  end

  def paymethod
  end
  
  def newcredit
  end

 private
 
  def set_category
    @parent = Category.where(ancestry: nil)
  end
end
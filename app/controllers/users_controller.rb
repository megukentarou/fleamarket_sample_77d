class UsersController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end

  def edit
    @parent = Category.where(ancestry: nil)
  end

  def paymethod
    @parent = Category.where(ancestry: nil)
  end
  
  def newcredit
    @parent = Category.where(ancestry: nil)
  end
end
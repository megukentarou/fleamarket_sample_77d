class UsersController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end
  
  def new
  end

  def show
  end
end
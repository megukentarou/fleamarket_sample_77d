class UsersController < ApplicationController
  before_action :move_to_login
  before_action :set_category

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def edit
  end

 private

  def move_to_login
    redirect_to new_user_session_path  unless user_signed_in?
  end
 
  def set_category
    @parent = Category.where(ancestry: nil)
  end
end
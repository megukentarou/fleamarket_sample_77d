class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :buy, :pay, :destroy]
  before_action :set_card, only: [:buy, :pay]
  before_action :not_buy, only: [:buy, :pay]
  before_action :not_edit, only: [:edit, :update, :destroy]
  require "payjp"

  def index
    @newItems = Item.includes(:images).order("created_at DESC").limit(5)
    @parent = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  # 親カテゴリーが選択された後の子カテゴリーのアクション
  def get_children_category
    # 選択された親カテゴリーに紐づく子カテゴリーの配列を取得
    @children_category = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後の孫カテゴリーのアクション
  def get_grandchildren_category
    # 選択された子カテゴリーに紐づく孫カテゴリーの配列を取得
    @grandchildren_category = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # フラッシュメッセージで登録成功の表示
      redirect_to root_path, notice: '出品情報の登録が完了しました'
    else
      flash.now[:alert] = "入力内容漏れがあります。下記を参照に修正してください。"
      render action: :new
    end
  end

  def show
  end
  
  def edit
    @item.images.build
  end

  def update
    if @item.update(item_params)
      # フラッシュメッセージで更新成功を表示
      redirect_to root_path, notice: '出品情報の更新が完了しました'
    else
      flash.now[:alert] = "入力内容漏れがあります。下記を参照に修正してください"
      render action: :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      # フラッシュメッセージで削除成功を表示
      redirect_to root_path, notice: '出品情報を削除しました'
    else
      flash.now[:alert] = '出品情報を削除できませんでした'
      render action: :show
    end
  end

  def buy
    @user = current_user
    if @card.present?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = set_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy',
    )
    if Soldout.create(item_id: @item.id, user_id: current_user.id)
      redirect_to root_path, notice: '商品の購入が完了しました'
    else
      flash.now[:alert] = '商品が購入できませんでした。'
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :price, :explanation,
      :category_id, :condition_id,
      :fee_id, :prefecture_id,
      :delivery_day_id, :brand,
      images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def not_buy
    redirect_to action: :show if (user_signed_in? && current_user.id == @item.user.id) || @item.soldout
  end

  def not_edit
    redirect_to action: :show unless user_signed_in? && current_user.id == @item.user.id
  end
end
class ItemsController < ApplicationController
  def index
    @parent = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.build
    # 親カテゴリーのデータを取り出して名前の要素を配列に追加していく
    # pluckメソッドで指定したカラムのレコードの配列を取得する
    # unshiftメソッドで配列の先頭に要素を挿入（カテゴリー選択の初期値"選択して下さい"を挿入)
    @parent_category =Category.where(ancestry: nil).pluck(:name)
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

  def create
    @item = Item.new(item_params)
    if @item.save
      # フラッシュメッセージで登録成功の表示
      redirect_to new_item_path, notice: '出品情報の登録が完了しました'
    else
      flash.now[:alert] = "入力内容漏れがあります。下記を参照に修正してください。"
      @parent_category = Category.where(ancestry: nil).pluck(:name)

      if params[:item][:images_attributes].blank?
        @item.images.build
        render action: :new
      else
      @item.images = [@item.images.new]
      render action: :new
      end
    end
  end

  def update
    @item = find_items_by_id
    if @item.update(item_params)
      # フラッシュメッセージで更新成功を表示
      redirect_to new_item_path, notice: '出品情報の更新が完了しました'
    else
      flash.now[:alert] = "入力内容漏れがあります。下記を参照に修正してください。"
      @item.images.build
      @parent_category = Category.where(ancestry: nil).pluck(:name)
      render action: :edit
    end
  end

  def show
  end

  def destroy
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

  def set_item
    @item = Item.find(params[:id])
  end
end

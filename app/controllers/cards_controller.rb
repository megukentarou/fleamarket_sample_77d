class CardsController < ApplicationController
  before_action :set_category
  before_action :set_card

  require "payjp"

  def index
  end

  def new
    @card = Card.new
  end


  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if params['payjp-token'].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user: current_user, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user)
      else
        redirect_to action: :new
      end
    end
  end

  def show
    if @card.present?
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: :index, notice: "削除しました"
    else
      redirect_to action: :index, alert: "削除できませんでした"
    end
  end


  private
 
  def set_category
    @parent = Category.where(ancestry: nil)
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
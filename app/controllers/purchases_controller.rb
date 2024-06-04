class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_item_availability, only: [:new, :create]

  def new
    @purchase = PurchaseForm.new
    @prefectures = Prefecture.all
    render 'orders/index'  # ビューの指定
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    @purchase.item_id = @item.id
    @purchase.user_id = current_user.id
    @prefectures = Prefecture.all

    if @purchase.save
      redirect_to @item, notice: '購入が完了しました。'
    else
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_item_availability
    if @item.user_id == current_user.id || @item.sold_out?
      redirect_to root_path, alert: 'この商品は購入できません。'
    end
  end

  def purchase_params
    params.require(:purchase_form).permit(
      :credit_card_number, :expiration_date, :cvv,
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :credit_card_number, :expiration_date, :cvv
    ).merge(user_id: current_user.id, item_id: @item.id)
  end

  def redirect_if_sold_out
    redirect_to root_path, alert: 'この商品は既に売却されています。' if @item.sold_out?
  end
end

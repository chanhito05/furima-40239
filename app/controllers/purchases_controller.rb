class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_item_availability, only: [:new, :create]

  

  def new
    @order = PaymentForm.new
    @prefectures = Prefecture.all
    render 'orders/index'  # ビューの指定
  end

  def create
    @order = PaymentForm.new(order_params)
    @order.user_id = current_user.id
    @order.item_id = @item.id
    @order.price = @item.price # priceの設定
    if @order.valid?
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],  # トークンを渡す
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path, notice: '購入が完了しました。'
    else
      @prefectures = Prefecture.all
      render 'orders/index', status: :unprocessable_entity
    end
    Rails.logger.debug("Order Params: #{order_params.inspect}")

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

  def order_params
    params.require(:payment_form).permit(
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token
    )
  end
end

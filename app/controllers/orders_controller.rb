class OrdersController < ApplicationController
  def index
    @order = PaymentForm.new
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @item = Item.find(params[:item_id])
    @order = PaymentForm.new(order_params)
    @order.user_id = current_user.id
    @order.item_id = @item.id
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private

  def order_params
    params.require(:payment_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token:params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
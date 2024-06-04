class OrdersController < ApplicationController
  
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_sk_test_08fa5480729c7409514eac6c"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  private

  def order_params
    params.require(:order).permit(:price)
  end


end

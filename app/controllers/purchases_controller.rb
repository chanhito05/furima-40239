class PurchasesController < ApplicationController
  before_action :set_item

  def new
    @purchase = Purchase.new
    render 'orders/index'  # ここで特定のビューファイルを指定
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.item = @item
    @purchase.user = current_user

    if @purchase.save
      redirect_to @item, notice: '購入が完了しました。'
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase).permit(
      :credit_card_number, :expiration_date, :cvv,
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number
    )
  end
end

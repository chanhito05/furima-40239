class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: '商品が正常に出品されました。'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :price)
  end
end
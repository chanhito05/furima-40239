class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.image.attached? == false
      @item.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'item-sample.png')), filename: 'item-sample.png', content_type: 'image/png')
    end
    if @item.save
      redirect_to root_path, notice: '商品が正常に出品されました。'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :price)
  end
end

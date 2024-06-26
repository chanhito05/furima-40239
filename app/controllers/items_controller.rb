class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :check_item_owner, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
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

  def destroy
    @item.destroy
    redirect_to root_path, notice: '商品が削除されました。'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  # def set_select_options
  #   @categories = Category.all
  #   @conditions = Condition.all
  #   @shipping_costs = ShippingCost.all
  #   @shipping_areas = ShippingArea.all
  #   @shipping_times = ShippingTime.all
  # end

  def check_item_owner
    unless @item.user_id == current_user.id
      redirect_to root_path, alert: '不正なアクセスです。'
    end
  end


  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :price)
  end

  # 購入完了画面へのパスを指定するヘルパーメソッド
  def purchase_confirmation_path(item)
    item_path(item) + "/purchase_confirmation" # 例：/items/1/purchase_confirmation
  end

end

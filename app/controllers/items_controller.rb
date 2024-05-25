class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
=begin 商品一覧機能のプルリクエストで使用するため
  def search
    @items = Item.where('name LIKE ?', "%#{params[:q]}%")
    render :index
  end
=end
end

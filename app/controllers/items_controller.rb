class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def search
    @items = Item.where('name LIKE ?', "%#{params[:q]}%")
    render :index
  end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: '商品情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end


end


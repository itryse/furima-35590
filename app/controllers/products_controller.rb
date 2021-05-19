class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

end
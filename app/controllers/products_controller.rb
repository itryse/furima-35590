class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
    if current_user != @product.user
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
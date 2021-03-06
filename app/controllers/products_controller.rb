class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :jamp_to_index, only: [:edit, :update, :destroy]

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
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user != @product.user
      redirect_to root_path
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def jamp_to_index
    if @product.purchase_record.present?
      redirect_to root_path
    end
  end

end
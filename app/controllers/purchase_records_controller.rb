class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :go_to_index, only: [:index, :create]
  before_action :back_to_index, only: [:index, :create]

  def index
    @purchase_record_shipping_record = PurchaseRecordShippingRecord.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_record_shipping_record = PurchaseRecordShippingRecord.new(purchase_record_params)
    if @purchase_record_shipping_record.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
      @purchase_record_shipping_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_shipping_record).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def go_to_index
    @product = Product.find(params[:product_id])
    if current_user == @product.user
      redirect_to root_path
    end
  end

  def back_to_index
    @product = Product.find(params[:product_id])
    if @product.purchase_record.present?
      redirect_to root_path
    end
  end

end
class PurchaseRecordsController < ApplicationController

  def index
    @purchase_record_shipping_record = PurchaseRecordShippingRecord.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_record_shipping_record = PurchaseRecordShippingRecord.new(purchase_record_params)
    if @purchase_record_shipping_record.valid?
      @purchase_record_shipping_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_shipping_record).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end

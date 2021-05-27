require 'rails_helper'

RSpec.describe PurchaseRecordShippingRecord, type: :model do

  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_record_shipping_record = FactoryBot.build(:purchase_record_shipping_record, user_id: user.id, product_id: product.id)
      sleep(1)
    end

    context '内容に問題ない場合' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_shipping_record).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_record_shipping_record.building_name = ''
        expect(@purchase_record_shipping_record).to be_valid
      end

    end

    context '内容に問題がある場合' do

      it 'postal_codeが空だと保存できないこと' do
        @purchase_record_shipping_record.postal_code = ''
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_shipping_record.postal_code = '1234567'
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_shipping_record.prefecture_id = ''
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Prefecture is not a number")
      end

      it 'prefectureを1と選択された場合は購入できないこと' do
        @purchase_record_shipping_record.prefecture_id = 1
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityを選択していないと保存できないこと' do
        @purchase_record_shipping_record.city = ''
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("City can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_shipping_record.phone_number = ''
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと登録できないこと' do
        @purchase_record_shipping_record.phone_number = '080111122223'
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角英数字混合だと登録できないこと' do
        @purchase_record_shipping_record.phone_number = '080ABCD1234'
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが全角数字だと登録できないこと' do
        @purchase_record_shipping_record.phone_number = '０８０１２３４５６７８'
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userと紐づいていないと登録できないこと' do
        @purchase_record_shipping_record.user_id = nil
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("User can't be blank")
      end

      it 'productと紐づいていないと登録できないこと' do
        @purchase_record_shipping_record.product_id = nil
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Product can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @purchase_record_shipping_record.token = ''
        @purchase_record_shipping_record.valid?
        expect(@purchase_record_shipping_record.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end

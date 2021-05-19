require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do

    context "商品出品ができるとき" do
      it '全ての情報が記入されていれば出品することができる' do
        @product.save
        expect(@product).to be_valid
      end

      it 'priceは半角数字かつ¥300~¥9,999,999の範囲内であれば登録することができる' do
        @product.price = 9999999
        expect(@product).to be_valid
      end
    end

    context "商品出品ができないとき" do
      it 'nameが空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductionが空だと出品できない' do
        @product.introduction = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end

      it 'condition_idが空だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition is not a number")
      end

      it 'postage_idが空だと出品できない' do
        @product.postage_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage is not a number")
      end

      it 'prefecture_idが空だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture is not a number")
      end

      it 'day_idが空だと出品できない' do
        @product.day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Day is not a number")
      end

      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it 'priceは¥300~¥9,999,999以外は登録できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      
      it 'priceは全角数字では登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
    end
    
  end

end
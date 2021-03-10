require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe 'ショップの新規投稿' do
    context '新規投稿できる時' do
      it '@shopの内容に問題ない' do
        expect(@shop).to be_valid
      end
    end

    context '新規投稿できない時' do
      it 'shop_nameが空では登録できない' do
        @shop.shop_name = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Shop name can't be blank")
      end

      it 'blandが空では登録できない' do
        @shop.bland = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Bland can't be blank")
      end

      it 'shop_detailが空では登録できない' do
        @shop.shop_detail = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Shop detail can't be blank")
      end

      it 'imageが空では登録できない' do
        @shop.image = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end 
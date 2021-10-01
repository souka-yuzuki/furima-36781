require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it '商品情報が全て存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが不明だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が不明だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担が不明だと出品できない' do
        @item.load_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end
      it '発送元の地域が不明だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が不明だと出品できない' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it '価格が不明だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字（スペースなし）で設定してください")
      end
      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字（スペースなし）で設定してください")
      end
      it '価格が一千万位上の物は出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字（スペースなし）で設定してください")
      end
      it '価格の数字が全角では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字（スペースなし）で設定してください")
      end
      it 'ユーザー情報が紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

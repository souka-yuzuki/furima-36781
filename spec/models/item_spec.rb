require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it '商品情報が全て存在すれば出品できる' do
        
      end
    end
    context '商品出品ができないとき' do
      it '商品画像がないと出品できない' do
        
      end
      it '商品名がないと出品できない' do
        
      end
      it '商品の説明がないと出品できない' do
        
      end
      it 'カテゴリーが不明だと出品できない' do
        
      end
      it '商品の状態が不明だと出品できない' do
        
      end
      it '配送料の負担が不明だと出品できない' do
        
      end
      it '発送元の地域が不明だと出品できない' do
        
      end
      it '発送までの日数が不明だと出品できない' do
        
      end
      it '価格が不明だと出品できない' do
        
      end
      it '価格が300円未満では出品できない' do
        
      end
      it '価格が一千万位上の物は出品できない' do
        
      end
      it '価格の数字が全角では出品できない' do
        
      end
      it 'ユーザー情報が紐付いていないと出品できない' do
        
      end
    end
  end
end

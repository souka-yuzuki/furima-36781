require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー情報が登録できるとき' do
      it 'ユーザー情報が全て正しければ登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー情報が登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@がなければ登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字未満では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'パスワードとパスワード（確認）は、値が一致でなければ登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '456def'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ空では登録できない' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください", "Last name can't be blank", "Last name 全角文字を使用してください")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'test'
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ空では登録できない' do
        @user.first_name_reading = ''
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank", "First name reading 全角文字(カナ)を使用してください", "Last name reading can't be blank", "Last name reading 全角文字(カナ)を使用してください")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）でなければ登録できない' do
        @user.first_name_reading = '田中'
        @user.last_name_reading = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角文字(カナ)を使用してください", "Last name reading 全角文字(カナ)を使用してください")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

end

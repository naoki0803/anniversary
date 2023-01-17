require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do 
    context '正常系：ユーザー新規登録ができる' do
      it 'すべての情報が正しく入力され、登録できる' do
        expect(@user).to be_valid
      end

      it '誕生日が空欄でも、登録できる' do
        @user.birth_date = nil
        expect(@user).to be_valid
      end
    end 
    context '異常系：ユーザー新規登録ができない' do
      it 'emailが空で登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it 'メールアドレスが一意性ではない' do
        user1 = FactoryBot.build(:user)
        user1.save
        user2 = FactoryBot.build(:user)
        user2.email = user1.email
        user2.valid?
        expect(user2.errors.full_messages).to include "Eメールはすでに存在します"
      end

      it 'メールアドレスに、@が含まれていない' do
        @user.email = "abcde.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end

      it 'PWが空で登録できない' do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'PWが6文字未満で登録できない' do
        @user.password = "1111a"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end

      it 'PWが半角英数字が混合されず登録できない' do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it 'PWとPW確認が一致せず登録できない' do
        @user.password = "111aaa"
        @user.password_confirmation = "111bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it '英字のみのパスワードで登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it '数字のみのパスワードで登録できない' do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it '全角文字を含むパスワードで登録できない' do
        @user.password = "１１１ａａａ"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it 'nicknameが空で登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
    end
  end
end

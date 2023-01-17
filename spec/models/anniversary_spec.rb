require 'rails_helper'

RSpec.describe Anniversary, type: :model do
  before do
    @anniversary = FactoryBot.build(:anniversary)
    @anniversary.image = fixture_file_upload('public/image/test.png')
  end

  describe '記念日の登録' do 
    context '正常系：記念日の登録ができる' do
      it 'すべての情報が正しく登録され、記念日が登録ができる' do
        expect(@anniversary).to be_valid
      end
      
      it '記念日の説明が空欄でも、記念日が登録ができる' do
        @anniversary.anniversary_description = ""
        expect(@anniversary).to be_valid
      end

      it '誰の記念日が空欄でも、記念日が登録ができる' do
        @anniversary.who_anniversary = ""
        expect(@anniversary).to be_valid
      end

      it '記念日の説明と、誰の記念日が空欄でも、記念日が登録ができる' do
        @anniversary.anniversary_description = ""
        @anniversary.who_anniversary = ""
        expect(@anniversary).to be_valid
      end
    end

    context '異常系：記念日の登録ができない' do
      it '画像(image)がなくて登録できない' do
        @anniversary.image = nil
        @anniversary.valid?
        expect(@anniversary.errors.full_messages).to include "画像を入力してください"
      end 

      it '記念日名が未入力で登録できない' do
        @anniversary.anniversary_name = ""
        @anniversary.valid?
        expect(@anniversary.errors.full_messages).to include "記念日名を入力してください"
      end 

      it '誕生日が空欄で、登録できない' do
        @anniversary.anniversary_date = nil
        @anniversary.valid?
        expect(@anniversary.errors.full_messages).to include "記念日を入力してください"
      end

      it 'カテゴリが未選択(デフォルトのまま)で登録できない' do
        @anniversary.category_id = "1"
        @anniversary.valid?
        expect(@anniversary.errors.full_messages).to include "カテゴリーを選択してください"
      end 
    end
  end
end

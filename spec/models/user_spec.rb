require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー作成' do
    context '内容に問題ない場合' do
      it 'すべての入力事項が揃っている' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空の時' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'nicknameが重複したら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nicknameはすでに存在します")
      end
      it 'emailが空の時' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it 'emailが重複していたら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordと確認用が異なったら登録できない' do
        @user.password = 'aaa1234'
        @user.password_confirmation = 'sss1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'passwordが英語だけでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは半角英数字混合で入力してください。")
      end
      it 'passwordが６文字以下だと登録できない' do
        @user.password = 'aa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end
    end
  end
end

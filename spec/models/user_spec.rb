require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "全ての項目の入力が存在すれば登録できること" do
        @user = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email                        
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
     it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
        it 'family_nameが全角入力でなければ登録できないこと' do
      @user.family_name = "a" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name= "a" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.family_name_kana = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = "aaa" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is invalid")
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include  ("Password is invalid")
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include  ('Password is invalid')
    end
   end
  end
 end


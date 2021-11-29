require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと出品できない' do
        @buy_address.prefecture_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'cityが空だと保存できないこと' do
          @buy_address.city = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Item can't be blank", "City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
          @buy_address.house_number = ''
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
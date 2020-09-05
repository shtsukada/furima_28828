require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buyaddress = FactoryBot.build(:buy_address)
  end

  describe '商品購入' do
    it '全ての値が正しく入力されていれば購入できること' do
      expect(@buyaddress).to be_valid
    end
    it 'user_idが空だと保存できないこと' do
      @buyaddress.user_id = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @buyaddress.item_id = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @buyaddress.token = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @buyaddress.postal_code = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyaddress.postal_code = '1234567'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include('Postal code is invalid')
    end
    it 'area_idが空だと保存できないこと' do
      @buyaddress.area_id = '0'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include('Area must be other than 0')
    end
    it 'cityが空だと保存できないこと' do
      @buyaddress.city = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @buyaddress.address = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Address can't be blank")
    end
    it 'telが空だと保存できないこと' do
      @buyaddress.tel = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telが11桁より長いと保存できないこと' do
      @buyaddress.tel = '080123456789'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
    end
    it 'telが半角のハイフンを含むと保存できないこと' do
      @buyaddress.tel = '080-1234-51'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include('Tel is invalid')
    end
  end
end

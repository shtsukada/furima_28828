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
      expect(@buyaddress.errors.full_messages).to include("Userを入力してください")
    end
    it 'item_idが空だと保存できないこと' do
      @buyaddress.item_id = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Itemを入力してください")
    end
    it 'tokenが空だと保存できないこと' do
      @buyaddress.token = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Tokenを入力してください")
    end
    it 'postal_codeが空だと保存できないこと' do
      @buyaddress.postal_code = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyaddress.postal_code = '1234567'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include('郵便番号は不正な値です')
    end
    it 'area_idが空だと保存できないこと' do
      @buyaddress.area_id = '0'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include('都道府県は0以外の値にしてください')
    end
    it 'cityが空だと保存できないこと' do
      @buyaddress.city = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'addressが空だと保存できないこと' do
      @buyaddress.address = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("番地を入力してください")
    end
    it 'telが空だと保存できないこと' do
      @buyaddress.tel = ''
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'telが11桁より長いと保存できないこと' do
      @buyaddress.tel = '080123456789'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end
    it 'telが半角のハイフンを含むと保存できないこと' do
      @buyaddress.tel = '080-1234'
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include('電話番号は不正な値です')
    end
  end
end

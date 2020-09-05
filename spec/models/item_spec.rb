require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,content,category_id,status_id,fee_id,area_id,day_id,price,user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では登録不可' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字より多いと登録不可' do
        @item.name = Faker::Name.initials(number: 50)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'contentが空では登録不可' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが1000文字より多いと登録不可' do
        @item.content = Faker::Name.initials(number: 1010)
        @item.valid?
        expect(@item.errors.full_messages).to include('Content is too long (maximum is 1000 characters)')
      end
      it 'category_idが0では登録不可' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'status_idが0では登録不可' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'fee_idが0では登録不可' do
        @item.fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 0')
      end
      it 'area_idが0では登録不可' do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it 'day_idが0では登録不可' do
        @item.day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it 'priceが空では登録不可' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さければ登録不可' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9999999より大ければ登録不可' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end

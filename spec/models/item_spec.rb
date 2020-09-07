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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'nameが40文字より多いと登録不可' do
        @item.name = Faker::Name.initials(number: 50)
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
      end
      it 'contentが空では登録不可' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'contentが1000文字より多いと登録不可' do
        @item.content = Faker::Name.initials(number: 1010)
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
      end
      it 'category_idが0では登録不可' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは0以外の値にしてください')
      end
      it 'status_idが0では登録不可' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は0以外の値にしてください')
      end
      it 'fee_idが0では登録不可' do
        @item.fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は0以外の値にしてください')
      end
      it 'area_idが0では登録不可' do
        @item.area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は0以外の値にしてください')
      end
      it 'day_idが0では登録不可' do
        @item.day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は0以外の値にしてください')
      end
      it 'priceが空では登録不可' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが300より小さければ登録不可' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は一覧にありません')
      end
      it 'priceが9999999より大ければ登録不可' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は一覧にありません')
      end
    end
  end
end

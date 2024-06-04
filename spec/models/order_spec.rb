require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order = FactoryBot.build(:order, user: @user, item: @item)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'ユーザーが紐付いていなければ購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end

      it '商品が紐付いていなければ購入できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end

      it '価格が空では購入できない' do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = PurchaseForm.new(
      item_id: 1,
      user_id: 1,
      credit_card_number: '4242424242424242',
      expiration_date: '12/34',
      cvv: '123',
      postal_code: '123-4567',
      prefecture_id: 1,
      city: '横浜市',
      address: '青山1-1-1',
      building: '柳ビル103',
      phone_number: '09012345678',
      token: 'sample_token',
    )
  end

  describe '内容に問題ない場合' do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_form).to be_valid
    end
  end

  describe '内容に問題がある場合' do
    it 'priceが空では保存ができないこと' do
      @purchase_form.price = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase_form.token = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'postal_codeが空では保存ができないこと' do
      @purchase_form.postal_code = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'prefecture_idが空では保存ができないこと' do
      @purchase_form.prefecture_id = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'cityが空では保存ができないこと' do
      @purchase_form.city = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'addressが空では保存ができないこと' do
      @purchase_form.address = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'phone_numberが空では保存ができないこと' do
      @purchase_form.phone_number = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'credit_card_numberが空では保存ができないこと' do
      @purchase_form.credit_card_number = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'expiration_dateが空では保存ができないこと' do
      @purchase_form.expiration_date = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'cvvが空では保存ができないこと' do
      @purchase_form.cvv = nil
      expect(@purchase_form).not_to be_valid
    end

    it 'postal_codeがハイフンなしでは保存ができないこと' do
      @purchase_form.postal_code = '1234567'
      expect(@purchase_form).not_to be_valid
    end

    it 'phone_numberが10桁未満では保存ができないこと' do
      @purchase_form.phone_number = '090123456'
      expect(@purchase_form).not_to be_valid
    end

    it 'phone_numberが12桁以上では保存ができないこと' do
      @purchase_form.phone_number = '090123456789'
      expect(@purchase_form).not_to be_valid
    end
  end
end
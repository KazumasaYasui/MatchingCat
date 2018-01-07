# spec/models/order_spec.rb
require 'rails_helper'

RSpec.describe Order, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:order) { build(:order) }
    it 'バリデーションに通過する' do
      expect(order).to be_valid
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'order_nameがnilの場合' do
      let(:order) { build(:order, order_name: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_nameが長すぎる場合' do
      let(:order) { build(:order, order_name: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_telがnilの場合' do
      let(:order) { build(:order, order_tel: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_telのformatが異なる場合' do
      let(:order) { build(:order, order_tel: "08012345678") }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_birthがnilの場合' do
      let(:order) { build(:order, order_birth: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_sexがnilの場合' do
      let(:order) { build(:order, order_sex: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_postal_codeがnilの場合' do
      let(:order) { build(:order, order_postal_code: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_postal_codeのformatが異なる場合' do
      let(:order) { build(:order, order_postal_code: "111-2222") }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_prefectureがnilの場合' do
      let(:order) { build(:order, order_prefecture: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_cityがnilの場合' do
      let(:order) { build(:order, order_city: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_cityが長すぎる場合' do
      let(:order) { build(:order, order_city: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_addressがnilの場合' do
      let(:order) { build(:order, order_address: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_addressが長すぎる場合' do
      let(:order) { build(:order, order_address: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_occupationがnilの場合' do
      let(:order) { build(:order, order_occupation: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_occupationが長すぎる場合' do
      let(:order) { build(:order, order_occupation: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_incomeがnilの場合' do
      let(:order) { build(:order, order_income: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_incomeの数値が0の場合' do
      let(:order) { build(:order, order_income: 0) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_incomeの数値がマイナスの場合' do
      let(:order) { build(:order, order_income: -1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_residenceがnilの場合' do
      let(:order) { build(:order, order_residence: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_residenceが長すぎる場合' do
      let(:order) { build(:order, order_residence: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_descriptionがnilの場合' do
      let(:order) { build(:order, order_description: nil) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
    context 'order_descriptionが長すぎる場合' do
      let(:order) { build(:order, order_description: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(order).to be_invalid
      end
    end
  end
end


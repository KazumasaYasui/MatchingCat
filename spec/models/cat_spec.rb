# spec/models/cat_spec.rb
require 'rails_helper'

RSpec.describe Cat, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:cat) { build(:cat) }
    it 'バリデーションに通過する' do
      expect(cat).to be_valid
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'cat_nameがnilの場合' do
      let(:cat) { build(:cat, cat_name: nil) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_nameが長すぎる場合' do
      let(:cat) { build(:cat, cat_name: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_ageがnilの場合' do
      let(:cat) { build(:cat, cat_age: nil) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_ageの数値がマイナスの場合' do
      let(:cat) { build(:cat, cat_age: -10) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_sexがnilの場合' do
      let(:cat) { build(:cat, cat_sex: nil) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_breedがnilの場合' do
      let(:cat) { build(:cat, cat_breed: nil) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_prefectureがnilの場合' do
      let(:cat) { build(:cat, cat_prefecture: nil) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_descriptionがnilの場合' do
      let(:cat) { build(:cat, cat_description: nil) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
    context 'cat_descriptionが長すぎる場合' do
      let(:cat) { build(:cat, cat_description: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(cat).to be_invalid
      end
    end
  end
end
# spec/models/reservation_spec.rb
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:reservation) { build(:reservation) }
    it 'バリデーションに通過する' do
      expect(reservation).to be_valid
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'reservation_nameがnilの場合' do
      let(:reservation) { build(:reservation, reservation_name: nil) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
    context 'reservation_nameが長すぎる場合' do
      let(:reservation) { build(:reservation, reservation_name: "a" * 1000 ) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
    context 'reservation_telがnilの場合' do
      let(:reservation) { build(:reservation, reservation_tel: nil) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
    context 'reservation_telのformatが異なる場合' do
      let(:reservation) { build(:reservation, reservation_tel: "08012345678" ) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
    context 'reservation_peopleがnilの場合' do
      let(:reservation) { build(:reservation, reservation_people: nil) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
    context 'reservation_peopleの数値がマイナスの場合' do
      let(:reservation) { build(:reservation, reservation_people: -11 ) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
    context 'reservation_peopleの数値が不正確な場合' do
      let(:reservation) { build(:reservation, reservation_people: 11 ) }
      it 'バリデーションに失敗する' do
        expect(reservation).to be_invalid
      end
    end
  end
end


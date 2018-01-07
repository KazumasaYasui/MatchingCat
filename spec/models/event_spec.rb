# spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:event) { build(:event) }
    it 'バリデーションに通過する' do
      expect(event).to be_valid
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'event_titleがnilの場合' do
      let(:event) { build(:event, event_title: nil) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_titleが長すぎる場合' do
      let(:event) { build(:event, event_title: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_bodyがnilの場合' do
      let(:event) { build(:event, event_body: nil) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_bodyが長すぎる場合' do
      let(:event) { build(:event, event_body: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_remarkがnilの場合' do
      let(:event) { build(:event, event_remark: nil) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_remarkが長すぎる場合' do
      let(:event) { build(:event, event_remark: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_datetimeがnilの場合' do
      let(:event) { build(:event, event_datetime: nil) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_addressがnilの場合' do
      let(:event) { build(:event, event_address: nil) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_addressが長すぎる場合' do
      let(:event) { build(:event, event_address: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_peopleがnilの場合' do
      let(:event) { build(:event, event_people: nil) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_peopleの数値が0の場合' do
      let(:event) { build(:event, event_people: 0) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
    context 'event_peopleの数値がマイナスの場合' do
      let(:event) { build(:event, event_people: -11) }
      it 'バリデーションに失敗する' do
        expect(event).to be_invalid
      end
    end
  end
end
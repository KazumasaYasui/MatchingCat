# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:post) { build(:post) }
    it 'バリデーションに通過する' do
      expect(post).to be_valid
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'post_titleがnilの場合' do
      let(:post) { build(:post, post_title: nil) }
      it 'バリデーションに失敗する' do
        expect(post).to be_invalid
      end
    end
    context 'post_titleが長すぎる場合' do
      let(:post) { build(:post, post_title: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(post).to be_invalid
      end
    end
    context 'post_bodyがnilの場合' do
      let(:post) { build(:post, post_body: nil) }
      it 'バリデーションに失敗する' do
        expect(post).to be_invalid
      end
    end
    context 'post_bodyが長すぎる場合' do
      let(:post) { build(:post, post_body: "a" * 5000) }
      it 'バリデーションに失敗する' do
        expect(post).to be_invalid
      end
    end
  end
end
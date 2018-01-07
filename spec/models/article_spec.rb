# spec/models/article_spec.rb
require 'rails_helper'

RSpec.describe Article, type: :model do
  # 正常系
  context '正常にデータが揃っている場合' do
    let(:article) { build(:article) }
    it 'バリデーションに通過する' do
      expect(article).to be_valid
    end
  end
  # 異常系
  context '正常にデータが揃っていない場合' do
    context 'article_titleがnilの場合' do
      let(:article) { build(:article, article_title: nil) }
      it 'バリデーションに失敗する' do
        expect(article).to be_invalid
      end
    end
    context 'article_titleが長すぎる場合' do
      let(:article) { build(:article, article_title: "a" * 1000) }
      it 'バリデーションに失敗する' do
        expect(article).to be_invalid
      end
    end
    context 'article_bodyがnilの場合' do
      let(:article) { build(:article, article_body: nil) }
      it 'バリデーションに失敗する' do
        expect(article).to be_invalid
      end
    end
    context 'article_bodyが長すぎる場合' do
      let(:article) { build(:article, article_body: "a" * 5000) }
      it 'バリデーションに失敗する' do
        expect(article).to be_invalid
      end
    end
  end
end
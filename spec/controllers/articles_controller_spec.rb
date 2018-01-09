# spec/controllers/articles_controller_spec.rb
require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "ログインしている場合" do
    let(:user) { create(:user) }
    login_user
    before :each do
      @article = create(:article)
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested article to @article" do
        get :show, params: { id: @article.id }
        expect(assigns(:article)).to eq @article
      end
      it "renders the :show template" do
        get :show, params: { id: @article.id }
        expect(response).to render_template :show
      end
    end
    # POSTのテスト
    describe 'POST #create' do
      it "saves the new contact in the database" do
        expect{
          post :create, params: {
            article: attributes_for(:article)
          }
        }.to change(Article, :count).by(1)
      end
      it "redirects to article_path" do
        post :create, params: {
          article: attributes_for(:article)
        }
        expect(response).to redirect_to article_path(assigns(:article))
      end
    end
    # PATCHのテスト
    describe 'PATCH #update' do
      it "locates the requersted @article" do
        patch :update, params: {
          id: @article, article: attributes_for(:article)
        }
        expect(assigns(:article)).to eq @article
      end

      it "changes @article's attributes" do
        patch :update, params: {
          id: @article, article: attributes_for(:article, article_title: "RSpecイベント")
        }
        @article.reload
        expect(@article.article_title).to eq("RSpecイベント")
      end

      it "redirects to article_path" do
        patch :update, params: {
          id: @article, article: attributes_for(:article)
        }
        expect(response).to redirect_to article_path(assigns(:article))
      end
    end
    # DELETEのテスト
    describe 'DELETE #destroy' do
      it "deletes the article" do
        expect{
          delete :destroy, params: {
            id: @article
          }
        }.to change(Article, :count).by(-1)
      end
    end
  end
  describe "ログインしていない場合" do
    before :each do
      @article = create(:article)
      get :show, params: { id: @article.id }
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested article to @article" do
        expect(assigns(:article)).to eq @article
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
    # POSTのテスト
    describe 'POST #create' do
      it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
      end
    end
    # PATCHのテスト
    describe 'PATCH #update' do
      it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
      end
    end
    # DELETEのテスト
    describe 'DELETE #destroy' do
      it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
      end
    end
  end
end
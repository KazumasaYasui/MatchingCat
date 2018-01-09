# spec/controllers/posts_controller_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "ログインしている場合" do
    let(:user) { create(:user) }
    login_user
    before :each do
      @post = create(:post)
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested post to @post" do
        get :show, params: { id: @post.id }
        expect(assigns(:post)).to eq @post
      end
      it "renders the :show template" do
        get :show, params: { id: @post.id }
        expect(response).to render_template :show
      end
    end
    # POSTのテスト
    describe 'POST #create' do
      it "saves the new contact in the database" do
        expect{
          post :create, params: {
            post: attributes_for(:post)
          }
        }.to change(Post, :count).by(1)
      end
      it "redirects to post_path" do
        post :create, params: {
          post: attributes_for(:post)
        }
        expect(response).to redirect_to post_path(assigns(:post))
      end
    end
    # PATCHのテスト
    describe 'PATCH #update' do
      it "locates the requersted @post" do
        patch :update, params: {
          id: @post, post: attributes_for(:post)
        }
        expect(assigns(:post)).to eq @post
      end

      it "changes @post's attributes" do
        patch :update, params: {
          id: @post, post: attributes_for(:post, post_title: "あなたのねこ")
        }
        @post.reload
        expect(@post.post_title).to eq("あなたのねこ")
      end

      it "redirects to post_path" do
        patch :update, params: {
          id: @post, post: attributes_for(:post)
        }
        expect(response).to redirect_to post_path(assigns(:post))
      end
    end
    # DELETEのテスト
    describe 'DELETE #destroy' do
      it "deletes the post" do
        expect{
          delete :destroy, params: {
            id: @post
          }
        }.to change(Post, :count).by(-1)
      end
    end
  end
  describe "ログインしていない場合" do
    before :each do
      @post = create(:post)
      get :show, params: { id: @post.id }
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested post to @post" do
        expect(assigns(:post)).to eq @post
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
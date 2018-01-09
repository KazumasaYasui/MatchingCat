# spec/controllers/cats_controller_spec.rb
require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  describe "ログインしている場合" do
    let(:user) { create(:user) }
    login_user
    before :each do
      @cat = create(:cat)
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested cat to @cat" do
        get :show, params: { id: @cat.id }
        expect(assigns(:cat)).to eq @cat
      end
      it "renders the :show template" do
        get :show, params: { id: @cat.id }
        expect(response).to render_template :show
      end
    end
    # POSTのテスト
    describe 'POST #create' do
      it "saves the new contact in the database" do
        expect{
          post :create, params: {
            # user_id: user.id, 
            cat: attributes_for(:cat)
          }
        }.to change(Cat, :count).by(1)
      end
      it "redirects to cat_path" do
        post :create, params: {
          # user_id: user.id, 
          cat: attributes_for(:cat)
        }
        expect(response).to redirect_to cat_path(assigns(:cat))
      end
    end
    # PATCHのテスト
    describe 'PATCH #update' do
      it "locates the requersted @cat" do
        patch :update, params: {
          id: @cat, cat: attributes_for(:cat)
        }
        expect(assigns(:cat)).to eq @cat
      end

      it "changes @cat's attributes" do
        patch :update, params: {
          id: @cat, cat: attributes_for(:cat, cat_name: "ジジ")
        }
        @cat.reload
        expect(@cat.cat_name).to eq("ジジ")
      end

      it "redirects to cat_path" do
        patch :update, params: {
          id: @cat, cat: attributes_for(:cat)
        }
        expect(response).to redirect_to cat_path(assigns(:cat))
      end
    end
    # DELETEのテスト
    describe 'DELETE #destroy' do
      it "deletes the cat" do
        expect{
          delete :destroy, params: {
            id: @cat
          }
        }.to change(Cat, :count).by(-1)
      end
    end
  end
  describe "ログインしていない場合" do
    before :each do
      @cat = create(:cat)
      get :show, params: { id: @cat.id }
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested cat to @cat" do
        expect(assigns(:cat)).to eq @cat
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
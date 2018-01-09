# spec/controllers/events_controller_spec.rb
require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "ログインしている場合" do
    let(:user) { create(:user) }
    login_user
    before :each do
      @event = create(:event)
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested event to @event" do
        get :show, params: { id: @event.id }
        expect(assigns(:event)).to eq @event
      end
      it "renders the :show template" do
        get :show, params: { id: @event.id }
        expect(response).to render_template :show
      end
    end
    # POSTのテスト
    describe 'POST #create' do
      it "saves the new contact in the database" do
        expect{
          post :create, params: {
            event: attributes_for(:event)
          }
        }.to change(Event, :count).by(1)
      end
      it "redirects to event_path" do
        post :create, params: {
          event: attributes_for(:event)
        }
        expect(response).to redirect_to event_path(assigns(:event))
      end
    end
    # PATCHのテスト
    describe 'PATCH #update' do
      it "locates the requersted @event" do
        patch :update, params: {
          id: @event, event: attributes_for(:event)
        }
        expect(assigns(:event)).to eq @event
      end

      it "changes @event's attributes" do
        patch :update, params: {
          id: @event, event: attributes_for(:event, event_title: "RSpecイベント")
        }
        @event.reload
        expect(@event.event_title).to eq("RSpecイベント")
      end

      it "redirects to event_path" do
        patch :update, params: {
          id: @event, event: attributes_for(:event)
        }
        expect(response).to redirect_to event_path(assigns(:event))
      end
    end
    # DELETEのテスト
    describe 'DELETE #destroy' do
      it "deletes the event" do
        expect{
          delete :destroy, params: {
            id: @event
          }
        }.to change(Event, :count).by(-1)
      end
    end
  end
  describe "ログインしていない場合" do
    before :each do
      @event = create(:event)
      get :show, params: { id: @event.id }
    end
    # GETのテスト
    describe 'GET #show' do
      it "assigns the requested event to @event" do
        expect(assigns(:event)).to eq @event
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
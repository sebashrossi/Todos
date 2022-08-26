require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:request) { get :index }

    before do
      user
      request
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    let(:params) {
      {
        name: "UserTest",
        email: "test@example.com"
      }
   }

    let(:request) { post :create, params: {user: params} }


    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'creates the user' do
      expect{ request }.to change { User.count }.by(1)
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:params) {
      {
        name: "UserTest"
      }
    }

    let(:request) { put :update, params: {id: user.id, user: params} }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'updates the existing user' do
      request
      expect(user.reload.name).to eq 'UserTest'
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:request) { delete :destroy, params: {id: user.id } }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'destroys the user' do
      user
      expect{ request }.to change { User.count }.by(-1)
    end
  end
end

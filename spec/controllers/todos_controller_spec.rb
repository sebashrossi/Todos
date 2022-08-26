require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:todo) { create(:todo, user: user) }
    let(:request) { get :index, params: { user_id: user.id } }

    before do
      todo
      request
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:params) {
      {
        name:    'Todo test',
        status:  'to_do',
        user_id: user.id
      }
   }

    let(:request) { post :create, params: {user_id: user.id, todo: params} }


    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'creates the user' do
      expect{ request }.to change { Todo.count }.by(1)
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:todo) { create(:todo, user: user) }
    let(:params) {
      {
        status: "to_do"
      }
    }

    let(:request) { put :update, params: {user_id: user.id, id: todo.id, todo: params} }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'updates the existing user' do
      request
      expect(todo.reload.status).to eq 'to_do'
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:todo) { create(:todo, user: user) }
    let(:request) { delete :destroy, params: {user_id: user.id, id: todo.id } }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'destroys the user' do
      todo
      expect{ request }.to change { Todo.count }.by(-1)
    end
  end
end

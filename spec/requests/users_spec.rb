require 'rails_helper'

RSpec.describe 'Users', type: :request do

  let(:valid_attributes) {
    {
      name:  'user test',
      email: 'a@a.com'
    }
  }

  let(:invalid_attributes) {
    {
      name: '',
      email: ''
    }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      User.create! valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      user = User.create! valid_attributes
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post users_url, params: { user: valid_attributes }
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        {
          name: 'New Name'
        }
      }

      it 'updates the requested user' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        expect(user.reload.name).to eq('New Name')
      end

      it 'redirects to the user' do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        expect(response).to redirect_to(user_url(user.reload))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect {
        delete user_url(user)
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create! valid_attributes
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end

require 'rails_helper'

RSpec.describe TodosController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/1/todos/new').to route_to('todos#new', user_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/todos/1/edit').to route_to('todos#edit', id: '1', user_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/1/todos').to route_to('todos#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/todos/1').to route_to('todos#update', id: '1', user_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/todos/1').to route_to('todos#update', id: '1', user_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/todos/1').to route_to('todos#destroy', id: '1', user_id: '1')
    end
  end
end

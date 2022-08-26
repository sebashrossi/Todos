require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/todos", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Todo. As you add validations to Todo, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user)}
  let(:valid_attributes) {
    {
      name: 'Todo test',
      status: 0,
      user_id: user.id
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Todo.create! valid_attributes
      get todos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      todo = Todo.create! valid_attributes
      get todo_url(todo)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_todo_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      todo = Todo.create! valid_attributes
      get edit_todo_url(todo)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Todo" do
        expect {
          post todos_url, params: { todo: valid_attributes }
        }.to change(Todo, :count).by(1)
      end

      it "redirects to the created todo" do
        post todos_url, params: { todo: valid_attributes }
        expect(response).to redirect_to(todo_url(Todo.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Todo" do
        expect {
          post todos_url, params: { todo: invalid_attributes }
        }.to change(Todo, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post todos_url, params: { todo: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested todo" do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: new_attributes }
        todo.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the todo" do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: new_attributes }
        todo.reload
        expect(response).to redirect_to(todo_url(todo))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        todo = Todo.create! valid_attributes
        patch todo_url(todo), params: { todo: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested todo" do
      todo = Todo.create! valid_attributes
      expect {
        delete todo_url(todo)
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      todo = Todo.create! valid_attributes
      delete todo_url(todo)
      expect(response).to redirect_to(todos_url)
    end
  end
end

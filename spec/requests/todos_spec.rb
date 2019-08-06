require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  let!(:todos) { create_list(:todo, 80) }
  let(:todo_id) { Todo.first.id }

  describe 'POST /todos' do
    it 'create a new todo record' do
      post '/api/v1/todos', params: { created_by: 'Jane', description: 'Renew ssl certificates' }

      data = JSON.parse(response.body)
      expect(data['description']).to eq('Renew ssl certificates')
      expect(response).to have_http_status(201)
    end

    it 'return a validation failure message' do
      post '/api/v1/todos'

      expect(response).to have_http_status(422)
      expect(response.body)
        .to match(/Validation failed: Description is required/)
    end
  end

  describe 'GET /todos/:id' do
    it 'return the todo' do
      get "/api/v1/todos/#{todo_id}"

      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data['id']).to eq(todo_id)
      expect(response).to have_http_status(200)
    end

    it 'return an error if todo does not exist' do
      get "/api/v1/todos/100"

      expect(response).to have_http_status(404)
      expect(response.body).to match(/Couldn't find Todo/)
    end
  end

  context 'when the record exists' do
    it 'updates the todo record' do
      put "/api/v1/todos/#{todo_id}", params: { description: 'Organise task items' }

      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data['id']).to eq(todo_id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /todos/:id' do
    it 'successfully deletes a todo record' do
      delete "/api/v1/todos/#{todo_id}"

      expect(response).to have_http_status(204)
      expect(Todo.find_by_id(todo_id)).to eq(nil)
    end
  end

  describe 'GET /todos' do
    it 'return the todos' do
      get '/api/v1/todos'

      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data.size).to eq(80)
      expect(response).to have_http_status(200)
    end
  end
end

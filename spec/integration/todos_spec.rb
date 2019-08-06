require 'swagger_helper'

describe 'Todos API', type: :request, swagger_doc: 'v1/swagger.json' do

  path '/api/v1/todos' do

    post 'Creates a todo' do
      tags 'Todos'
      consumes 'application/json'
      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string },
          completed: { type: :boolean }
        },
        required: [ 'description' ]
      }

      response '201', 'todo created' do
        let(:todo) { { description: 'Dodo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:todo) { { } }
        run_test!
      end
    end
  end

  path '/api/v1/todos/{id}' do

    get 'Get a todo' do
      tags 'Todos'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'todo found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            description: { type: :string },
            completed: { type: :boolean },
            completed_at: { type: :string, 'x-nullable': true, example: '2019-08-08'}
          },
          required: [ 'id' ]

        let(:id) { Todo.create(description: 'Task 1').id }
        run_test!
      end

      response '404', 'todo not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/todos' do

    get 'Get a list of todos' do
      tags 'Todos'
      produces 'application/json'

      response '200', 'todos' do
        schema type: :array,
          properties: {
            description: { type: :string },
            completed: { type: :boolean },
            completed_at: { type: :string, 'x-nullable': true, example: '2019-08-08'}
          }

        run_test!
      end
    end
  end

  path '/api/v1/todos/{id}' do

    put 'Updates a todo' do
      tags 'Todos'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'todo found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            description: { type: :string },
            completed: { type: :boolean },
            completed_at: { }
          },
          required: [ 'id' ]

        let(:id) { Todo.create(description: 'Task 1').id }
        run_test!
      end
    end
  end
end
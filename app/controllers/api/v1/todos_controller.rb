module Api
  module V1
    class TodosController < ApplicationController
      before_action :set_todo, only: [:show, :update, :destroy]

      def index
        @todos = Todo.all
        render json: @todos, status: :ok
      end

      def create
        @todo = Todo.create!(todo_params)
        render json: @todo, status: :created
      end

      def show
        render json: @todo, status: :ok
      end

      def update
        @todo.update!(todo_params)
        render json: @todo, status: :ok
      end

      def destroy
        @todo.destroy
        head :no_content
      end

      private

      def todo_params
        params.permit(:description, :completed, :completed_at)
      end

      def set_todo
        @todo = Todo.find(params[:id])
      end
    end
  end
end

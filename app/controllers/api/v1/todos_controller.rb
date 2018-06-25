module Api
  module V1
    class TodosController < ApplicationController
      # ---------------------------------------------------------------------- /
      # LIST :
      # ---------------------------------------------------------------------- /
      def index
        todos = Todo.all
        render json: {status: 'SUCCESS', message: 'index todos', data: todos}, status: :ok
      end

      # ---------------------------------------------------------------------- /
      # CREATE
      # ---------------------------------------------------------------------- /
      def create
        todo = Todo.new(todo_params)
        if todo.save
          render json: {status: 'SUCCESS', message: 'todo created', data: todo}, status: :ok
        else
          render json: {status: 'ERROR', message: 'create todo failed', data: todo.errors }, status: :unprocessable_entity
        end
      end

      # ---------------------------------------------------------------------- /
      # READ
      # ---------------------------------------------------------------------- /
      def show
        todo = Todo.find(params[:id])
        render json: {status: 'SUCCESS', message: 'show todo', data: todo}, status: :ok
      end

      # ---------------------------------------------------------------------- /
      # UPDATE
      # ---------------------------------------------------------------------- /
      def update
        todo = Todo.find(params[:id])
        if todo.update_attributes(todo_params)
          render json: {status: 'SUCCESS', message: 'todo updated', data: todo}, status: :ok
        else
          render json: {status: 'ERROR', message: 'update todo failed', data: todo.errors }, status: :unprocessable_entity
        end
      end

      # ---------------------------------------------------------------------- /
      # DELETE
      # ---------------------------------------------------------------------- /
      def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        render json: {status: 'SUCCESS', message: 'todo deleted', data: todo}, status: :ok
      end

      private

      # ---------------------------------------------------------------------- /
      # "white-list" parameters
      # ---------------------------------------------------------------------- /
      def todo_params
        params.permit(:title, :desc, :done)
      end

    end
  end
end

module Api
  module V1
    class TodosController < ApplicationController

      before_action :select_todo, only: [:show, :update, :destroy]
      # JEM
      skip_before_action :verify_authenticity_token

      # ---------------------------------------------------------------------- /
      # LIST :
      # ---------------------------------------------------------------------- /
      def index
        @todos = Todo.all
        render json: {status: 'SUCCESS', message: 'todos loaded', data: @todos}, status: :ok
      end

      # ---------------------------------------------------------------------- /
      # CREATE
      # ---------------------------------------------------------------------- /
      def create
        @todo = Todo.new(todo_params)
        if @todo.save
          render json: {status: 'SUCCESS', message: 'todo created', data: @todo}, status: :ok
        else
          render json: {status: 'ERROR', message: 'create todo failed', data: @todo.errors }, status: :unprocessable_entity
        end
      end

      # ---------------------------------------------------------------------- /
      # READ
      # ---------------------------------------------------------------------- /
      def show
        render json: {status: 'SUCCESS', message: 'show todo', data: @todo}, status: :ok
      end

      # ---------------------------------------------------------------------- /
      # UPDATE
      # ---------------------------------------------------------------------- /
      def update
        if @todo.update_attributes(todo_params)
          render json: {status: 'SUCCESS', message: 'todo updated', data: @todo}, status: :ok
        else
          render json: {status: 'ERROR', message: 'update todo failed', data: @todo.errors }, status: :unprocessable_entity
        end
      end

      # ---------------------------------------------------------------------- /
      # DELETE
      # ---------------------------------------------------------------------- /
      def destroy
        @todo.destroy
        render json: {status: 'SUCCESS', message: 'todo deleted', data: @todo}, status: :ok
      end

      private

      # ---------------------------------------------------------------------- /
      # "white-list" parameters
      # ---------------------------------------------------------------------- /
      def todo_params
        params.permit(:title, :desc, :done)
      end

      def select_todo
        @todo = Todo.find(params[:id])
      end

    end
  end
end

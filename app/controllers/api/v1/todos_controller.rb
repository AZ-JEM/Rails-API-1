module Api
  module V1
    class TodosController < ApplicationController
      def index
        todos = Todo.all
        render json: {status: 'SUCCESS', message: 'Todos index', data: todos}, status: :ok
      end
    end
  end
end

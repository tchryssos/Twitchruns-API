module Api
  module V1
    class RunnersController < ApplicationController


      def index
        runners=Runner.all
        render json: runners
      end

      def show
      end

    end
  end
end

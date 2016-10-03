module Api
  module V1
    class RunsController < ApplicationController

      def index
        runs=Run.all
        render json: runs
      end

      def show
      end

    end
  end
end

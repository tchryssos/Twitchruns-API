module Api
  module V1
    class RunsController < ApplicationController

      def index
        if params[:limit]
          runs = Run.all.limit(10).includes(:runs)
        else
          runs = Run.all.includes(:runs)
        end
        render json: runs
      end

      def show
      end

    end
  end
end

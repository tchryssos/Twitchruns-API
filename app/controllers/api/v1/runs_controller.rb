module Api
  module V1
    class RunsController < ApplicationController

      def index
        if params[:limit]
          runs = Run.all.limit(10).includes(:runner, :game, :category_leaderboard)
        else
          runs = Run.all.includes(:runner, :game, :category_leaderboard)
        end
        render json: runs
      end

      def show
      end

    end
  end
end

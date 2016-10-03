module Api
  module V1
    class CategoryLeaderboardsController < ApplicationController
      def index
        categories=CategoryLeaderboard.all
        render json: categories
      end

      def show
      end
    end
  end
end

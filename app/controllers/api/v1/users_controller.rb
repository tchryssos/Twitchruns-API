
module Api
  module V1
    class UsersController < ApplicationController
      def new
      end

      def create
      end

      def show
        user=User.find(params[:id])
        render json: user
      end
    end
  end
end

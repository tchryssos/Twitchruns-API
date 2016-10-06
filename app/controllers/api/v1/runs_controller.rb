module Api
  module V1
    class RunsController < ApplicationController

      def index
        if params[:limit]
          runs = Run.all.limit(10)    
        else  
          runs = Run.all
        end
        render json: runs
      end


      def show
      end

    end
  end
end

module Api
  module V1
    class RunnersController < ApplicationController


      def index
        filtered_runners=[]
        runners=Runner.all
        runners.map do |runner|
          if runner.runs != []
            filtered_runners<<runner
          end
        end
        render json: filtered_runners
      end

      def show
      end

    end
  end
end

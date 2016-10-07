module Api
  module V1
    class StreamsController < ApplicationController
      def find
        game=Run.find(params["run"]["id"]).game

        slugified_game_name=game.name.tr(" ","_").tr("/","_").downcase

        twitch=Adapter::TwitchWrapper.new

        game_streams=twitch.get_streams(slugified_game_name)

        render json: game_streams
      end

      private

      def run_params
        params.require("run")
      end
    end
  end
end

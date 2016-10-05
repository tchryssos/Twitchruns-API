module Api
  module V1
    class StreamsController < ApplicationController
      
      
    #   def create
    #   end

      def show
        if id = 51
            @game = "Syndrome"
        else
            @game = "League of Legends"
        end

      @response_to_be_parsed=nil
      @parsed_response = []
      @twitch_base="https://api.twitch.tv/kraken"
      @twitch_client_id="?client_id="+ENV["TWITCH_SECRET"]
      @response_to_be_parsed = HTTParty.get("#{@twitch_base}/streams/#{@twitch_client_id}")["streams"]
        @response_to_be_parsed.each do |stream|
            if stream["game"] == @game
                @parsed_response << stream["channel"]["url"]
            end
        end
        render json: @parsed_response
      end
    end
  end
end

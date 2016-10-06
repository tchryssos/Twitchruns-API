class Adapter
  class TwitchWrapper

    attr_accessor :response, :twitch_base, :twitch_client_id

    def initialize
      @response=nil
      @twitch_base="https://api.twitch.tv/kraken"
      @twitch_client_id="?client_id="+ENV["TWITCH_SECRET"]
    end

    def get_user(username)
      @response=HTTParty.get("#{@twitch_base}/users/#{username}/#{@twitch_client_id}")
    end

    def get_streams(slugified_game_name)
       response = HTTParty.get("#{@twitch_base}/search/streams#{@twitch_client_id}&q=#{slugified_game_name}")

       return response
    end

  end
  # END OF TWITCH WRAPPER

  class SpeedrunWrapper

    #I NEED TO BUILD A RUNNER METHOD FOR THIS CUZ IT'S A MESS.

    attr_accessor :api_games, :api_categories, :api_leaderboards, :api_runners

    def initialize
      @response=nil
      @api_games=[]
      @api_categories=[]
      @api_leaderboards=[]
      @api_runners=[]
      @speedrun_base="http://www.speedrun.com/api/v1"
    end

    def fetch_games
      #The selected games have to be hard coded because the speedrun API doesn't allow for sorting by popularity. Right now we're taking the top 20 most popular games.

      selected_games=%w(sm64 oot sms alttp Portal sa2b smb smw mk8 pkmnredblue undertale mm lm Destiny pd2 me smb1 yi bk smgalaxy)

      selected_games.each do |game_abv|
        @api_games<<HTTParty.get("#{@speedrun_base}/games/#{game_abv}")["data"]
      end
    end

    def create_games_and_categories
      @api_games.each do |game|
        if game["assets"]["cover-large"]["uri"]
          new_game=Game.create(name: game["names"]["international"], artwork_url: game["assets"]["cover-large"]["uri"], speedrun_id:game["id"])
        else
          new_game=Game.create(name: game["names"]["international"], artwork_url: game["assets"]["logo"]["uri"], speedrun_id:game["id"])
        end


        @api_categories<<HTTParty.get("#{@speedrun_base}/games/#{game["id"]}/categories")["data"][0..2]

        @api_categories.last.each do |cate|
          CategoryLeaderboard.create(game_id:new_game.id, title:cate["name"], rules: cate["rules"], speedrun_id:cate["id"])
        end
      end
    end

    def fetch_runs(range_beginning, range_end)
      #RUN THIS AFTER CREATING GAMES AND CATEGORIES, BUT ONLY DO 30 AT A TIME BECAUSE OTHERWISE YOU'LL GO OVER THE RATE LIMIT.
      CategoryLeaderboard.all[range_beginning..range_end].each do |category|
        @api_leaderboards<<HTTParty.get("#{@speedrun_base}/leaderboards/#{category.game.speedrun_id}/category/#{category.speedrun_id}?top=3")["data"]
      end
    end

    def fetch_runners(range_beginning, range_end)
      #RUN THIS AFTER FETCHING THE RUNS, BUT BEFORE CREATING THEM, SINCE YOU NEED RUNNERS TO HAVE RUNS. SIMILARLY, DON'T RUN THIS WITH MORE THAN 30 AT A TIME OR YOU'LL GO OVER THE RATE LIMIT.
      @api_leaderboards[range_beginning..range_end].compact.each do |leaderboard|
        # binding.pry
        unless leaderboard["runs"].nil?
          leaderboard["runs"].each do |run|
            @api_runners<<HTTParty.get("#{@speedrun_base}/users/#{run["run"]["players"][0]["id"]}")["data"]
          end
        end
      end
    end

    def create_runners
      #RUN THIS AFTER FETCHING ALL THE RUNNERS
      @api_runners.compact.each do |runner|
        if runner["twitch"]
          Runner.create(username: runner["names"]["international"], stream_url: runner["twitch"]["uri"], speedrun_id:runner["id"])
        else
          Runner.create(username: runner["names"]["international"], speedrun_id:runner["id"])
        end
        Runner.create(username: "Unregistered Runner", speedrun_id:"harambe")
      end
    end

    def create_runs
      #RUN THIS AFTER CREATING ALL THE RUNNERS
      @api_leaderboards.compact.each do |leaderboard|
        n=0

          leaderboard["runs"].each do |run|
            if run["run"]["players"][0]["rel"]=="guest"
              runner=Runner.all.find_by(speedrun_id: "harambe")
            else
              runner=Runner.all.find_by(speedrun_id: run["run"]["players"][0]["id"])
            end

            run_leaderboard=CategoryLeaderboard.all.find_by(speedrun_id:run["run"]["category"])

            new_run=Run.create(speedrun_id: run["run"]["id"], run_url:run["run"]["videos"]["links"][0]["uri"], runner_id:runner.id, category_leaderboard_id:run_leaderboard.id)

            split_place=run_leaderboard.placements.split(",")

            split_place[n]=new_run.speedrun_id

            run_leaderboard.placements=split_place.join(",")

            run_leaderboard.save

            n+=1
        end
      end
    end


    def api_call_runner
      fetch_games
      create_games_and_categories
      sleep(61)
      fetch_runs(0,29)
      sleep(61)
      fetch_runs(30,-1)
      sleep(61)
      fetch_runners(0,29)
      sleep(61)
      fetch_runners(30,-1)
      create_runners
      create_runs
    end
  end
## END OF SPEEDRUN WRAPPER
end
## END OF ADAPTER CLASS

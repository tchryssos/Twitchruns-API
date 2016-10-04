class Runner < ApplicationRecord
  has_many :runs
  has_many :category_leaderboards, through: :runs
  has_many :games, through: :category_leaderboards

  def placed_runs
    placed_runs_hash={}
    runs=self.runs
    runs.each do |run|
      CategoryLeaderboard.all.each do |leaderboard|
        placements=leaderboard.placements.split(",")
        if placements.find{|placed_run| placed_run===run.speedrun_id}
          game_name=leaderboard.game.name
          category=leaderboard.title
          placing=placements.index(run.speedrun_id)+1
          placed_runs_hash[game_name]={category=>{placing=>run.speedrun_id}}
        end
      end
    end
    return placed_runs_hash
  end

end

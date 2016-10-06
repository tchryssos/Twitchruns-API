class Runner < ApplicationRecord
  has_many :runs
  has_many :category_leaderboards, through: :runs
  has_many :games, through: :category_leaderboards

  def placed_runs
    placed_runs_array=[]
    runs=self.runs
    runs.each do |run|
      CategoryLeaderboard.all.each do |leaderboard|
        placements=leaderboard.placements.split(",")
        if placements.find{|placed_run| placed_run===run.speedrun_id}
          game_name=leaderboard.game.name
          category=leaderboard.title
          placing=placements.index(run.speedrun_id)+1
          placing_run={game: game_name, category: category, placing: placing, speedrun_id:run.speedrun_id}
          placed_runs_array<<placing_run
        end
      end
    end
    return placed_runs_array
  end

end

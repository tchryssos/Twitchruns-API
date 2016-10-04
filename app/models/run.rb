class Run < ApplicationRecord
  belongs_to :category_leaderboard
  belongs_to :runner
  has_one :game, through: :category_leaderboard
  has_many :saved_runs

  def run_placement
    placed_runs_hash={}
    CategoryLeaderboard.all.each do |leaderboard|
      placements=leaderboard.placements.split(",")
      if placements.find{|placed_run| placed_run===self.speedrun_id}
        game_name=leaderboard.game.name
        category=leaderboard.title
        placing=placements.index(self.speedrun_id)+1
        placed_runs_hash[game_name]={category=>placing}
      end
    end
  return placed_runs_hash
  end

  def runner_id
    return self.runner.id
  end

end

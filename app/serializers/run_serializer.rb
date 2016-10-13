class RunSerializer<ActiveModel::Serializer
  attributes :speedrun_id, :id, :run_url, :run_placement, :runner_id, :place, :thumbnail
  has_one :runner
  has_one :game
  has_one :category_leaderboard
end

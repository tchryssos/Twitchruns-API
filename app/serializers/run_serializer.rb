class RunSerializer<ActiveModel::Serializer
  attributes :speedrun_id, :id
  has_one :runner
  has_one :category_leaderboard
  has_one :game
end

class RunnerSerializer<ActiveModel::Serializer
  attributes :username, :id, :stream_url, :twitch_id
  has_many :runs
  has_many :games
  has_many :category_leaderboards
end

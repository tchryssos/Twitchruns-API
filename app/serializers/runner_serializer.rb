class RunnerSerializer<ActiveModel::Serializer
  attributes :username, :id, :stream_url, :twitch_id, :placed_runs
  has_many :runs

end

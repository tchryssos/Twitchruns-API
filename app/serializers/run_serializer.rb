class RunSerializer<ActiveModel::Serializer
  attributes :speedrun_id, :id, :run_url
  has_one :runner
end

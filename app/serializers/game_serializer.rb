class GameSerializer<ActiveModel::Serializer
  attributes :name, :id, :artwork_url
  has_many :category_leaderboards
  has_many :runners
  has_many :runs
end

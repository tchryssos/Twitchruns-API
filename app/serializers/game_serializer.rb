class GameSerializer<ActiveModel::Serializer
  attributes :name, :id, :artwork_url
  has_many :category_leaderboards
end

class CategoryLeaderboardSerializer<ActiveModel::Serializer
  attributes :title, :rules, :placement_list
  has_many :runs
  has_one :game
  has_many :runners
end

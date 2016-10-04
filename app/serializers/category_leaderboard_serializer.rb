class CategoryLeaderboardSerializer<ActiveModel::Serializer
  attributes :title, :rules, :placement_list
  has_one :game
end

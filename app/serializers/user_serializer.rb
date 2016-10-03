class UserSerializer<ActiveModel::Serializer
  attributes :username, :id
  has_many :runs
  has_many :games
  has_many :runners
end

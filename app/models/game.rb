class Game < ApplicationRecord
  has_many :category_leaderboards
  has_many :runs, through: :category_leaderboards
  has_many :runners, through: :runs
end

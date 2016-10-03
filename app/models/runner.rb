class Runner < ApplicationRecord
  has_many :runs
  has_many :category_leaderboards, through: :runs
  has_many :games, through: :category_leaderboards
end

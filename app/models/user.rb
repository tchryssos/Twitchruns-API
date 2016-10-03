class User < ApplicationRecord
  has_secure_password
  has_many :saved_runs
  has_many :runs, through: :saved_runs
  has_many :runners, through: :runs
  has_many :category_leaderboards, through: :runs
  has_many :games, through: :category_leaderboards
end

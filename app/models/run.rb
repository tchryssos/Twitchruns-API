class Run < ApplicationRecord
  belongs_to :category_leaderboard
  belongs_to :runner
  has_one :game, through: :category_leaderboard
  has_many :saved_runs
end

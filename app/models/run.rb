class Run < ApplicationRecord
  belongs_to :category_leaderboard
  belongs_to :runner
  has_many :saved_runs
end

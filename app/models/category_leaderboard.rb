class CategoryLeaderboard < ApplicationRecord
  belongs_to :game
  has_many :runs
  has_many :runners, through: :runs
end

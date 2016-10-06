class CategoryLeaderboard < ApplicationRecord

  belongs_to :game
  has_many :runs
  has_many :runners, through: :runs

  def placement_list
    split_placements=self.placements.split(",")
    new_placements_list={}
    split_placements.each_with_index do |place, i|
      new_placements_list[i+1]=Run.find_by(speedrun_id: place)
    end
    return new_placements_list
  end
end

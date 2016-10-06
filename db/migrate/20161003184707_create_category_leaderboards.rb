class CreateCategoryLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_table :category_leaderboards do |t|
      t.string :placements, default: "1,2,3"
      t.integer :game_id
      t.string :title
      t.string :rules
      t.string :speedrun_id

      t.timestamps
    end
  end
end

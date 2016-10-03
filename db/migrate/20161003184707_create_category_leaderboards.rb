class CreateCategoryLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_table :category_leaderboards do |t|
      t.string :placements, default: "1,2,3,4,5,6,7,8,9,10"
      t.integer :game_id
      t.string :title
      t.string :rules

      t.timestamps
    end
  end
end

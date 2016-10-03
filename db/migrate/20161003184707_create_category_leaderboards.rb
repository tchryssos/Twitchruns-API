class CreateCategoryLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_table :category_leaderboards do |t|
      t.string :placements
      t.integer :game_id
      t.string :title
      t.string :rules

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :artwork_url
      t.string :speedrun_id
      t.timestamps
    end
  end
end

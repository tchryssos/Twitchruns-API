class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.string :speedrun_id
      t.integer :runner_id
      t.integer :categoryleaderboard_id
      t.string :run_url

      t.timestamps
    end
  end
end

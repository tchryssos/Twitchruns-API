class CreateRunners < ActiveRecord::Migration[5.0]
  def change
    create_table :runners do |t|
      t.string :username
      t.string :stream_url
      t.integer :twitch_id

      t.timestamps
    end
  end
end

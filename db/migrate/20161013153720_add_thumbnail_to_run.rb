class AddThumbnailToRun < ActiveRecord::Migration[5.0]
  def change
    add_column :runs, :thumbnail, :string
  end
end

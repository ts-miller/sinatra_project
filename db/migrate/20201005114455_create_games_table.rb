class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :quality
      t.integer :resolution_x
      t.integer :resolution_y
      t.integer :avg_fps
      t.integer :pc_id
    end
  end
end

class GameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :description
      t.string :result
      t.string :best_player
      t.string :game_status


      t.timestamps
    end
  end
end

class GameRef < ActiveRecord::Migration
  def up
    add_column :games, :game_ref, :string
  end

  def down
  end
end

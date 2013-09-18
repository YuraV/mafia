class DefaultGameStatus < ActiveRecord::Migration
  def up
    change_column :games, :game_status, :string, default: 'open'
  end

  def down
  end
end

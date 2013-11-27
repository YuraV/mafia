class BestPlayerType < ActiveRecord::Migration
  def up
    change_column :games, :best_player, :string
  end

  def down
  end
end

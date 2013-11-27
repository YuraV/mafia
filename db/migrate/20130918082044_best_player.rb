class BestPlayer < ActiveRecord::Migration
  def up
    change_column :games, :best_player, :integer
  end

  def down
  end
end

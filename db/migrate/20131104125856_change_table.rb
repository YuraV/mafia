class ChangeTable < ActiveRecord::Migration
  def change
    rename_table :players, :game_roles_players
  end
end

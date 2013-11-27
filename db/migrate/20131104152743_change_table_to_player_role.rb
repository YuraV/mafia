class ChangeTableToPlayerRole < ActiveRecord::Migration
  def change
    rename_table :game_roles_players, :player_roles
  end

  def down
  end
end

class ChangeTable < ActiveRecord::Migration
  def change
    rename_table :player, :game_roles_players
  end
end

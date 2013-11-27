class AddGameIdToPlayerRolesTable < ActiveRecord::Migration
  def change
    add_column :player_roles, :game_id, :integer
  end
end

class AddRoleForPlayers < ActiveRecord::Migration
  def up
  	add_column :players, :role, :string
  end

  def down
  end
end

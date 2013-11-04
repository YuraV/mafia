class ChangeGameRoleNameType < ActiveRecord::Migration
  def change
    change_column :game_roles, :name, :string
  end

  def down
  end
end

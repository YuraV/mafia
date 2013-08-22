class AddColumnManageTableGames < ActiveRecord::Migration
  def up
    add_column :games, :manager, :string
  end

  def down
  end
end

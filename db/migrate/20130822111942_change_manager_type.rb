class ChangeManagerType < ActiveRecord::Migration
  def up
    change_column :games, :manager, :integer
  end

  def down
  end
end

class RemoveManagerFieldFromGameTable < ActiveRecord::Migration
  def up
    remove_column :games, :manager
  end

  def down
  end
end

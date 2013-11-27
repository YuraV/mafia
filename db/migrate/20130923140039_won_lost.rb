class WonLost < ActiveRecord::Migration
  def up
    add_column :appointments, :won, :boolean
  end

  def down
  end
end

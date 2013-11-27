class PlayerNumber < ActiveRecord::Migration
  def up
    add_column :appointments, :player_number, :integer
  end

  def down
  end
end

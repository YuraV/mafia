class Team < ActiveRecord::Migration
  def up
    add_column :appointments, :team, :string
  end

  def down
  end
end

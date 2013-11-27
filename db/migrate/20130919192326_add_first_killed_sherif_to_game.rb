class AddFirstKilledSherifToGame < ActiveRecord::Migration
  def change
  	add_column :games, :first_killed_sheriff, :boolean
  end
end

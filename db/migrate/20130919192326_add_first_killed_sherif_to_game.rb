class AddFirstKilledSherifToGame < ActiveRecord::Migration
  def change
  	add_column :games, :first_killed_sherif, :boolean
  end
end

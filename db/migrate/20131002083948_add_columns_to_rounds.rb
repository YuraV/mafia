class AddColumnsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :round_number, :integer
    add_column :rounds, :kill, :boolean
    add_column :rounds, :vote, :boolean
  end
end

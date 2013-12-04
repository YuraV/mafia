class KillNominate < ActiveRecord::Migration
  def up
	  add_column :players, :kill, :boolean, default: false
	  add_column :players, :nominate, :boolean, default: false
  end
end

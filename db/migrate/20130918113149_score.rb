class Score < ActiveRecord::Migration
  def up
    add_column :appointments, :score, :integer
  end

  def down
  end
end

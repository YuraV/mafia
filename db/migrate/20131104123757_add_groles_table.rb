class AddGrolesTable < ActiveRecord::Migration
  def change
    create_table :game_roles do |t|
      t.integer :name

      t.timestamps
    end
  end
end

class PlayersRole < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :game_role_id


      t.timestamps
    end
  end

  def down
  end
end

class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :appointment_id
      t.integer :game_id
      t.integer :user_id
      t.timestamps
    end
  end
end

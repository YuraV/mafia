class AppointmentsTable < ActiveRecord::Migration
  def change
    create_table(:appointments) do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps

    end

  end

  def down
  end
end
